//
//  UIBarButtonItem+BSExtension.h
//  百思不得姐
//
//  Created by Lucius on 16/9/17.
//  Copyright © 2016年 Benjamin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (BSExtension)
+(instancetype)itemWithImage:(NSString *)image highlightedImage:(NSString *)highlightedImage target:(id)target action:(SEL)action
;
@end
