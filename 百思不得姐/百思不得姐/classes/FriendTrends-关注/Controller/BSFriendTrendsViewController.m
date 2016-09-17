//
//  BSFriendTrendsViewController.m
//  百思不得姐
//
//  Created by Lucius on 16/9/14.
//  Copyright © 2016年 Benjamin. All rights reserved.
//

#import "BSFriendTrendsViewController.h"

@interface BSFriendTrendsViewController ()

@end

@implementation BSFriendTrendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的关注";
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"friendsRecommentIcon" highlightedImage:@"friendsRecommentIcon-click" target:self action:@selector(friendClick)];
}

-(void)friendClick
{
    
}

@end
