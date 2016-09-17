//
//  BSMeViewController.m
//  百思不得姐
//
//  Created by Lucius on 16/9/14.
//  Copyright © 2016年 Benjamin. All rights reserved.
//

#import "BSMeViewController.h"

@interface BSMeViewController ()

@end

@implementation BSMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的";
    
    UIBarButtonItem *settingItem = [UIBarButtonItem itemWithImage:@"mine-setting-icon" highlightedImage:@"mine-setting-icon-click" target:self action:@selector(settingClick)];
    UIBarButtonItem *moonItem = [UIBarButtonItem itemWithImage:@"mine-moon-icon" highlightedImage:@"mine-moon-icon-click" target:self action:@selector(moonClick)];

    self.navigationItem.rightBarButtonItems = @[settingItem,moonItem];
    
}

-(void)settingClick
{
}

-(void)moonClick
{
}
@end
