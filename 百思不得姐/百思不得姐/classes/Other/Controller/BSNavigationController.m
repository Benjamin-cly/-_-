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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
    btn.size = CGSizeMake(70, 30);
    viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn ];
    
    [super pushViewController:viewController animated:animated];
}
@end
