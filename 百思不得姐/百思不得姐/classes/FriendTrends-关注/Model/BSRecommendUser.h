//
//  BSRecommendUser.h
//  百思不得姐
//
//  Created by Lucius on 16/10/25.
//  Copyright © 2016年 Benjamin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BSRecommendUser : NSObject
/** 用户头像*/
@property (nonatomic, copy)NSString *header;
/** 粉丝数 */
@property (nonatomic, assign) NSInteger fans_count;
/** 昵称*/
@property (nonatomic, copy)NSString *screen_name;

@end
