//
//  BSRecommendViewController.m
//  百思不得姐
//
//  Created by Lucius on 16/9/23.
//  Copyright © 2016年 Benjamin. All rights reserved.
//

#import "BSRecommendViewController.h"
#import <SVProgressHUD.h>
#import <AFNetworking.h>
#import <MJExtension.h>
#import "BSRecommendTypeCell.h"
#import "BSRecommendType.h"
#import "BSRecommendUserCell.h"
#import "BSRecommendUser.h"
#import <MJRefresh.h>

#define BSSelectedType self.types[self.typeTableView.indexPathForSelectedRow.row]

@interface BSRecommendViewController ()<UITableViewDataSource,UITableViewDelegate>
/** 左边的类别数据*/
@property (strong, nonatomic)NSArray *types;
/** 左边的类别表格*/
@property (weak, nonatomic) IBOutlet UITableView *typeTableView;
/** 右侧的用户表格*/
@property (weak, nonatomic) IBOutlet UITableView *userTableView;

@end

@implementation BSRecommendViewController

static NSString * const BSTypeId = @"Type";
static NSString * const BSUserId = @"user";


- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化控件
    [self setupTableView];
    
    //添加刷新控件
    [self setupRefresh];
    
    //添加指示器
    [SVProgressHUD show];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    
    //发送请求
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"category";
    parameters[@"c"] = @"subscribe";
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //隐藏指示器
        [SVProgressHUD dismiss];
        //服务器返回的JSON数据
       self.types = [BSRecommendType mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        BSLog(@"%@",responseObject);
        //刷新表格
        [self.typeTableView reloadData];
        
        //默认选中首行
        [self.typeTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"加载推荐信息失败!"];
    }];
}
/**
 *  初始化控件
 */
-(void)setupTableView
{
    
    //注册
    [self.typeTableView registerNib:[UINib nibWithNibName:NSStringFromClass([BSRecommendTypeCell class]) bundle:nil] forCellReuseIdentifier:BSTypeId];
    [self.userTableView registerNib:[UINib nibWithNibName:NSStringFromClass([BSRecommendUserCell class]) bundle:nil] forCellReuseIdentifier:BSUserId];
    //设置标题
    self.title = @"推荐关注";
    //设置tableView
    self.userTableView.rowHeight = 70;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.typeTableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    self.userTableView.contentInset = self.typeTableView.contentInset;
    
    //设置背景色
    self.view.backgroundColor = BSGlogbalBgColor;
}
/**
 *  添加上拉刷新
 */
-(void)setupRefresh
{
    
    self.userTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreUsers)];
    
    self.userTableView.mj_footer.hidden = YES;
    
    
}

#pragma mark -加载更多用户数据
-(void)loadMoreUsers
{
    BSRecommendType *type = BSSelectedType;
    
    //发送请求,加载右侧数据
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"list";
    parameters[@"c"] = @"subscribe";
    parameters[@"category_id"] = @(type.id);
    parameters[@"page"] = @(++type.curren_page);
    
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        BSLog(@"%@",downloadProgress);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //字典数据-->模型数据
        NSArray *users = [BSRecommendUser mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        //添加当前数据添加到对应的用户数组中
        
        [type.users addObjectsFromArray:users];
        //刷新右侧表格
        [self.userTableView reloadData];
        
        //结束刷新状态
        if (type.users.count == type.total) {
            [self.userTableView.mj_footer endRefreshingWithNoMoreData];
        }else{
            [self.userTableView.mj_footer endRefreshing];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        BSLog(@"%@",error);
        
    }];
}

#pragma mark - <UITableViewDataSource>

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.typeTableView) {//左边的类别表格
        return self.types.count;
    }else{//右边的用户表格
        NSInteger count = [BSSelectedType users].count;
        self.userTableView.mj_footer.hidden = (count == 0);
        return count;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.typeTableView) {
        
        BSRecommendTypeCell *cell = [tableView dequeueReusableCellWithIdentifier:BSTypeId];
        cell.type = self.types[indexPath.row];
        
        return cell;
    }else{
        BSRecommendUserCell *cell = [tableView dequeueReusableCellWithIdentifier:BSUserId];
        cell.user = [BSSelectedType users][indexPath.row];
        return cell;
    }
}



#pragma mark - <UITableViewDelegate>
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BSRecommendType *type = self.types[indexPath.row];
    BSLog(@"-----%@",type.name);

    if (type.users.count) {
        [self.userTableView reloadData];
        [self.userTableView.mj_footer resetNoMoreData];
    }else{
        //马上刷新，不现实上次的类容
        [self.userTableView reloadData];
        
        //设置当前页码为 1
        type.curren_page = 1;
        
        //发送请求,加载右侧数据
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        parameters[@"a"] = @"list";
        parameters[@"c"] = @"subscribe";
        parameters[@"category_id"] = @(type.id);
        parameters[@"page"] = @(type.curren_page);

        [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
            BSLog(@"%@",downloadProgress);
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            BSLog(@"%@",responseObject);
            //字典数据 -> 模型数据
            NSArray *users = [BSRecommendUser mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
            //添加当前数据添加到对应的用户数组中
            [type.users addObjectsFromArray:users];
            
            //保存总数
            type.total = [responseObject[@"total"] integerValue];
            
            //刷新右侧表格
            [self.userTableView reloadData];
            
            //判断是否需要下拉刷新
            if (type.users.count == type.total) {//页数 等于 总数(全部加载完毕)
                [self.userTableView.mj_footer endRefreshingWithNoMoreData];
            }
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            BSLog(@"%@",error);
            
        }];
    }
    
}










@end
