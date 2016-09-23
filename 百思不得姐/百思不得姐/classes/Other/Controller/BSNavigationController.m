//
//  BSNavigationController.m
//  百思不得姐
//
//  Created by Lucius on 16/9/20.
//  Copyright © 2016年 Benjamin. All rights reserved.
//

#import "BSNavigationController.h"

@interface BSNavigationController ()

@end

@implementation BSNavigationController
/**
 *  当第一次使用这个类的时候会调用一次
 */
+ (void)initialize
{
    //对所有NavigationBar  的appearance设置生效
    //UINavigationBar *bar = [UINavigationBar appearance];
    
    //对导航栏在BSNavigationController 中， appearance的设置才回生效
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[BSNavigationController class]]];
    [bar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航控制器的背景色
//    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"返回" forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
//        btn.size = CGSizeMake(70, 30);
        [btn sizeToFit];
        btn.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        // 修改导航栏左边的item
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn ];
        
        // 隐藏tabbar
        viewController.hidesBottomBarWhenPushed = YES;
}
    // 这句super的push要放在后面, 让viewController可以覆盖上面设置的leftBarButtonItem
    [super pushViewController:viewController animated:animated];
}

-(void)back
{
    [self popViewControllerAnimated:YES];
}

@end
