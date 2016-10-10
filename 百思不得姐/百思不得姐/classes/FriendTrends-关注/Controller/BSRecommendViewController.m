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

@interface BSRecommendViewController ()

@end

@implementation BSRecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"推荐关注";
    //设置背景色
    self.view.backgroundColor = BSGlogbalBgColor;
    //发送请求
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"category";
    parameters[@"c"] = @"subscribe";
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}


@end
