//
//  UIBarButtonItem+BSExtension.m
//  百思不得姐
//
//  Created by Lucius on 16/9/17.
//  Copyright © 2016年 Benjamin. All rights reserved.
//

#import "UIBarButtonItem+BSExtension.h"

@implementation UIBarButtonItem (BSExtension)

+(instancetype)itemWithImage:(NSString *)image highlightedImage:(NSString *)highlightedImage target:(id)target action:(SEL)action
{
    
    UIButton *Butten = [UIButton buttonWithType:UIButtonTypeCustom];
    [Butten setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [Butten setBackgroundImage:[UIImage imageNamed:highlightedImage] forState:UIControlStateHighlighted];
    Butten.size = Butten.currentBackgroundImage.size;
    [Butten addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:Butten];
}
@end
