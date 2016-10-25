//
//  BSRecommendUserCell.m
//  百思不得姐
//
//  Created by Lucius on 16/10/24.
//  Copyright © 2016年 Benjamin. All rights reserved.
//

#import "BSRecommendUserCell.h"
#import "BSRecommendUser.h"
#import <UIImageView+WebCache.h>

@interface BSRecommendUserCell()
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UILabel *screenNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *fansCountLabel;


@end

@implementation BSRecommendUserCell


-(void)setUser:(BSRecommendUser *)user
{
    _user = user;
    
    self.screenNameLabel.text = user.screen_name;
    self.fansCountLabel.text = [NSString stringWithFormat:@"%zd人关注",user.fans_count];
    [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:user.header] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    
}

@end
