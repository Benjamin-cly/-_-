//
//  BSRecommendType.h
//  百思不得姐
//
//  Created by Lucius on 16/10/14.
//  Copyright © 2016年 Benjamin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BSRecommendType : NSObject
/** id */
@property (nonatomic, assign) NSInteger id;

/** count */
@property (nonatomic, assign) NSInteger count;

/** name */
@property (nonatomic, copy)NSString *name;

/** 所选类别对应的用户数据*/
@property (strong, nonatomic)NSMutableArray *users;




@end
