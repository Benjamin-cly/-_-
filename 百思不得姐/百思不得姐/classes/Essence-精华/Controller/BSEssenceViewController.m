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
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highlightedImage:@"MainTagSubIconClick" target:self action:@selector(mainTagClick)];
    //设置背景色
    self.view.backgroundColor = BSGlogbalBgColor;
}

-(void)mainTagClick
{
    NSLog(@"lalalal");
}
@end
