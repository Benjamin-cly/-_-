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

@interface BSRecommendViewController ()<UITableViewDataSource,UITableViewDelegate>
/** 左边的类别数据*/
@property (strong, nonatomic)NSArray *types;
/** 右边的用户数据*/
@property (strong, nonatomic)NSArray *users;
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
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"加载推荐信息失败!"];
    }];
}

#pragma mark - <UITableViewDataSource>

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.typeTableView) {
        return self.types.count;
    }else{
        return self.users.count;
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
        cell.user = self.users[indexPath.row];
        return cell;
    }
}



#pragma mark - <UITableViewDelegate>
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BSRecommendType *type = self.types[indexPath.row];
    BSLog(@"-----%@",type.name);
    //发送请求,加载右侧数据
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"list";
    parameters[@"c"] = @"subscribe";
    parameters[@"category_id"] = @(type.id);
    
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        BSLog(@"%@",downloadProgress);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        self.users = [BSRecommendUser mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        //刷新右侧表格
        [self.userTableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        BSLog(@"%@",error);
        
    }];
    
}










@end
