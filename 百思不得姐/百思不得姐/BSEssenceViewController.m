//
//  BSEssenceViewController.m
//  百思不得姐
//
//  Created by Lucius on 16/9/14.
//  Copyright © 2016年 Benjamin. All rights reserved.
//

#import "BSEssenceViewController.h"

@interface BSEssenceViewController ()

@end

@implementation BSEssenceViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.titleView = [[UIImageView alloc ] initWithImage:[UIImage imageNamed:@"MainTitle" ]];
    
    UIButton *mainTagButten = [UIButton buttonWithType:UIButtonTypeCustom];
    [mainTagButten setBackgroundImage:[UIImage imageNamed:@"MainTagSubIcon"] forState:UIControlStateNormal];
    [mainTagButten setBackgroundImage:[UIImage imageNamed:@"MainTagSubIconClick"] forState:UIControlStateSelected];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:mainTagButten];
    
}



@end
