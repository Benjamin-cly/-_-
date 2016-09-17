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
    
    UIButton *setTagButten = [UIButton buttonWithType:UIButtonTypeCustom];
    [setTagButten setBackgroundImage:[UIImage imageNamed:@"mine-setting-icon"] forState:UIControlStateNormal];
    [setTagButten setBackgroundImage:[UIImage imageNamed:@"mine-setting-icon-click"] forState:UIControlStateHighlighted];
    setTagButten.size = setTagButten.currentBackgroundImage.size;
    [setTagButten addTarget:self action:@selector(setting) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *moonTagButten = [UIButton buttonWithType:UIButtonTypeCustom];
    [moonTagButten setBackgroundImage:[UIImage imageNamed:@"mine-moon-icon"] forState:UIControlStateNormal];
    [moonTagButten setBackgroundImage:[UIImage imageNamed:@"mine-moon-icon-click"] forState:UIControlStateHighlighted];
    moonTagButten.size = moonTagButten.currentBackgroundImage.size;
    [moonTagButten addTarget:self action:@selector(moon) forControlEvents:UIControlEventTouchUpInside];

    self.navigationItem.rightBarButtonItems = @[
                                            [[UIBarButtonItem alloc] initWithCustomView:setTagButten],
                                            [[UIBarButtonItem alloc] initWithCustomView:moonTagButten]
                                                ];
    
}

-(void)setting
{
}

-(void)moon
{
}
@end
