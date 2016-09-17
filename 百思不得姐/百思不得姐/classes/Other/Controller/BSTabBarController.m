//
//  BSTabBarController.m
//  百思不得姐
//
//  Created by Lucius on 16/9/13.
//  Copyright © 2016年 Benjamin. All rights reserved.
//

#import "BSTabBarController.h"
#import "BSEssenceViewController.h"
#import "BSNewViewController.h"
#import "BSFriendTrendsViewController.h"
#import "BSMeViewController.h"
#import "BSTabBar.h"

@interface BSTabBarController ()

@end

@implementation BSTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //通过设置tabbar的appearance 统一设置tabbar的文字属性
    //只要方法后面有带有 UI_APPEARANCE_SELECTOR  就可以通过appearance对象来统一设置
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    //添加子控制器
    [self setChildVc:[[BSEssenceViewController alloc]init] title:@"精华" image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon"];
    [self setChildVc:[[BSNewViewController alloc]init] title:@"新帖" image:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon"];
    [self setChildVc:[[BSFriendTrendsViewController alloc]init] title:@"关注" image:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon"];
    [self setChildVc:[[BSMeViewController alloc]init] title:@"我" image:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon"];
    //更换tabbar为自定义tabbar
    [self setValue:[[BSTabBar alloc] init] forKey:@"tabBar"];
    
}

/**
 *  子控制器初始化
 *
 *  @param vc            控制器类型
 *  @param title         标题
 *  @param image         图片
 *  @param selectedImage 选中图片
 */
- (void)setChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    //设置文字和图片,背景色
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    
    //添加为子控制器
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    //设置导航控制器的背景色
    [nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    [self addChildViewController:nav];
    
}

@end
