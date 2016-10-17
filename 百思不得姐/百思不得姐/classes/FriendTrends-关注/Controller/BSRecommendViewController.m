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

@interface BSRecommendViewController ()<UITableViewDataSource,UITableViewDelegate>
/** 左边的类别数据*/
@property (strong, nonatomic)NSArray *types;
/** 左边的类别表格*/
@property (weak, nonatomic) IBOutlet UITableView *typeTableView;


@end

@implementation BSRecommendViewController

static NSString * const BSTypeId = @"Type";

- (void)viewDidLoad {
    [super viewDidLoad];
    //注册
    [self.typeTableView registerNib:[UINib nibWithNibName:NSStringFromClass([BSRecommendTypeCell class]) bundle:nil] forCellReuseIdentifier:BSTypeId];
    
    self.title = @"推荐关注";
    
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
        
        //刷新表格
        [self.typeTableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"加载推荐信息失败!"];
    }];
}

#pragma - <UITableViewDelegate>

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.types.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    BSRecommendTypeCell *cell = [tableView dequeueReusableCellWithIdentifier:BSTypeId];
    cell.type = self.types[indexPath.row];
    
    return cell;
}














@end
