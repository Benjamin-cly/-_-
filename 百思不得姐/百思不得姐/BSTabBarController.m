//
//  BSTabBarController.m
//  百思不得姐
//
//  Created by Lucius on 16/9/13.
//  Copyright © 2016年 Benjamin. All rights reserved.
//

#import "BSTabBarController.h"

@interface BSTabBarController ()

@end

@implementation BSTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIViewController *vc01 = [[UIViewController alloc]init];
    vc01.tabBarItem.title = @"精华";
    vc01.tabBarItem.image = [UIImage imageNamed:@"tabBar_essence_icon"];
    vc01.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_essence_click_icon"];
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    [vc01.tabBarItem setTitleTextAttributes:attrs forState:UIControlStateNormal];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    [vc01.tabBarItem setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
//    UIImage *image = [UIImage imageNamed:@"tabBar_essence_click_icon"];
//    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    vc01.tabBarItem.selectedImage = image;
    vc01.view.backgroundColor = [UIColor redColor];
    [self addChildViewController:vc01];
    
    UIViewController *vc02 = [[UIViewController alloc]init];
    vc02.tabBarItem.title = @"新帖";
    vc02.tabBarItem.image = [UIImage imageNamed:@"tabBar_new_icon"];
    vc02.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_new_click_icon"];
    [vc02.tabBarItem setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [vc02.tabBarItem setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    vc02.view.backgroundColor = [UIColor greenColor];
    [self addChildViewController:vc02];
    
    UIViewController *vc03 = [[UIViewController alloc]init];
    vc03.tabBarItem.title = @"关注";
    vc03.tabBarItem.image = [UIImage imageNamed:@"tabBar_friendTrends_icon"];
    vc03.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_friendTrends_click_icon"];
    [vc03.tabBarItem setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [vc03.tabBarItem setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    vc03.view.backgroundColor = [UIColor grayColor];
    [self addChildViewController:vc03];
    
    UIViewController *vc04 = [[UIViewController alloc]init];
    vc04.tabBarItem.title = @"我";
    vc04.tabBarItem.image = [UIImage imageNamed:@"tabBar_me_icon"];
    vc04.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_me_click_icon"];
    [vc04.tabBarItem setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [vc04.tabBarItem setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    vc04.view.backgroundColor = [UIColor yellowColor];
    [self addChildViewController:vc04];
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
