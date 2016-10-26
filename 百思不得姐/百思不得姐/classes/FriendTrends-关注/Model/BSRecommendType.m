//
//  BSRecommendType.m
//  百思不得姐
//
//  Created by Lucius on 16/10/14.
//  Copyright © 2016年 Benjamin. All rights reserved.
//

#import "BSRecommendType.h"

@implementation BSRecommendType
/** 懒加载 users 数据*/
-(NSMutableArray *)users
{
    if (!_users) {
        self.users = [NSMutableArray array];
    }
    return _users;
}
@end
