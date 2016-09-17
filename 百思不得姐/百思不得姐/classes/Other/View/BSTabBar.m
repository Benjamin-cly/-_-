//
//  BSTabBar.m
//  百思不得姐
//
//  Created by Lucius on 16/9/14.
//  Copyright © 2016年 Benjamin. All rights reserved.
//

#import "BSTabBar.h"

@interface BSTabBar()
//发布按钮
@property (weak, nonatomic)UIButton *publishButten;

@end

@implementation BSTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //设置背景色
        [self setBackgroundImage:[UIImage imageNamed:@"tabbar-light"]];
        //添加一个发布按钮
        UIButton *publishButten = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishButten setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishButten setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        
        [self addSubview:publishButten];
        self.publishButten = publishButten;
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    //设置发布按钮的frame
    self.publishButten.bounds = CGRectMake(0, 0, self.publishButten.currentBackgroundImage.size.width, self.publishButten.currentBackgroundImage.size.height);
    self.publishButten.center = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.5);
    
    //设置其他按钮的frame
    CGFloat buttonY = 0;
    CGFloat buttonW = self.frame.size.width / 5;
    CGFloat buttonH = self. frame.size.height;
    NSInteger index = 0;
    
    for (UIView *button in self.subviews) {
        if (![button isKindOfClass:NSClassFromString(@"UITabBarButton")]) continue;
        
        CGFloat buttonX = buttonW * ((index > 1)?(index + 1):index);
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        index ++;
    }
}

@end
