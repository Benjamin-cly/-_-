//
//  BSFriendTrendsViewController.m
//  百思不得姐
//
//  Created by Lucius on 16/9/14.
//  Copyright © 2016年 Benjamin. All rights reserved.
//

#import "BSFriendTrendsViewController.h"
#import "BSRecommendViewController.h"

@interface BSFriendTrendsViewController ()

@end

@implementation BSFriendTrendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的关注";
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"friendsRecommentIcon" highlightedImage:@"friendsRecommentIcon-click" target:self action:@selector(friendClick)];
    //设置背景色
    self.view.backgroundColor = BSGlogbalBgColor;
    BSLogFunc;
}

-(void)friendClick
{
    BSRecommendViewController *vc = [[BSRecommendViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];

}

@end
