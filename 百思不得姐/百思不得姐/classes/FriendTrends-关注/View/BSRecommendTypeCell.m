//
//  BSRecommendTypeCell.m
//  百思不得姐
//
//  Created by Lucius on 16/10/17.
//  Copyright © 2016年 Benjamin. All rights reserved.
//

#import "BSRecommendTypeCell.h"
#import "BSRecommendType.h"

@interface BSRecommendTypeCell()
/** 选中是得指示图标*/
@property (weak, nonatomic) IBOutlet UIView *selectedIndicator;

@end

@implementation BSRecommendTypeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = BSColor(244, 244, 244);
    self.selectedIndicator.backgroundColor = BSColor(219, 21, 26);
}

- (void)setType:(BSRecommendType *)type
{
    _type = type;
    self.textLabel.text = type.name;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    //重新调整内部 textlabel 的 frame
    self.textLabel.y = 2;
    self.textLabel.height = self.contentView.height - 2 * self.textLabel.y;
    
}
/**
 *  
 */
-(void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    self.selectedIndicator.hidden = !selected;
    //通过监听选择状态，来修改文字颜色
    self.textLabel.textColor = selected ?self.selectedIndicator.backgroundColor :BSColor(78, 78, 78);
}
@end
