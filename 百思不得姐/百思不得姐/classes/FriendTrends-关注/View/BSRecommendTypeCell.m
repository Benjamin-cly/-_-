//
//  BSRecommendTypeCell.m
//  百思不得姐
//
//  Created by Lucius on 16/10/17.
//  Copyright © 2016年 Benjamin. All rights reserved.
//

#import "BSRecommendTypeCell.h"
#import "BSRecommendType.h"

@implementation BSRecommendTypeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setType:(BSRecommendType *)type
{
    _type = type;
    self.textLabel.text = type.name;
}

@end
