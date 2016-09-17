//
//  BSNewViewController.m
//  百思不得姐
//
//  Created by Lucius on 16/9/14.
//  Copyright © 2016年 Benjamin. All rights reserved.
//

#import "BSNewViewController.h"

@interface BSNewViewController ()

@end

@implementation BSNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView = [[UIImageView alloc ] initWithImage:[UIImage imageNamed:@"MainTitle" ]];
    
    UIButton *meTagButten = [UIButton buttonWithType:UIButtonTypeCustom];
    [meTagButten setBackgroundImage:[UIImage imageNamed:@"MainTagSubIcon"] forState:UIControlStateNormal];
    [meTagButten setBackgroundImage:[UIImage imageNamed:@"MainTagSubIconClick"] forState:UIControlStateHighlighted];
    meTagButten.size = meTagButten.currentBackgroundImage.size;
    [meTagButten addTarget:self action:@selector(gogo) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:meTagButten];
}

-(void)gogo{
    NSLog(@"lalalal");
}
@end
