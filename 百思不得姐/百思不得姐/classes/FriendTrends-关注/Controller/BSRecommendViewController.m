//
//  BSRecommendViewController.m
//  百思不得姐
//
//  Created by Lucius on 16/9/23.
//  Copyright © 2016年 Benjamin. All rights reserved.
//

#import "BSRecommendViewController.h"
#import <AFNetworking.h>
#import <SVProgressHUD.h>

@interface BSRecommendViewController ()

@end

@implementation BSRecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"推荐关注";
    //设置背景色
    self.view.backgroundColor = BSGlogbalBgColor;
    
}


@end
