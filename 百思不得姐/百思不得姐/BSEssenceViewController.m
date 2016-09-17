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
    
    UIButton *essenceTagButten = [UIButton buttonWithType:UIButtonTypeCustom];
    [essenceTagButten setBackgroundImage:[UIImage imageNamed:@"MainTagSubIcon"] forState:UIControlStateNormal];
    [essenceTagButten setBackgroundImage:[UIImage imageNamed:@"MainTagSubIconClick"] forState:UIControlStateHighlighted];
    essenceTagButten.size = essenceTagButten.currentBackgroundImage.size;
    [essenceTagButten addTarget:self action:@selector(gogo) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:essenceTagButten];
    
}

-(void)gogo{
    NSLog(@"lalalal");
}
@end
