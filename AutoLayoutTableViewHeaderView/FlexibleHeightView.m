//
//  FlexibleHeightView.m
//  AutoLayoutTableViewHeaderView
//
//  Created by Czw on 15/09/2017.
//  Copyright © 2017 Czw. All rights reserved.
//

#import "FlexibleHeightView.h"

@interface FlexibleHeightView()
@property (nonatomic, strong, readonly) UILabel *label11;
@property (nonatomic, strong, readonly) UILabel *label12;
@property (nonatomic, strong, readonly) UILabel *label21;
@property (nonatomic, strong, readonly) UILabel *label22;
@property (nonatomic, strong, readonly) UILabel *label31;
@property (nonatomic, strong, readonly) UILabel *label32;
@end

@implementation FlexibleHeightView
// form
/*
 --------------------------
 |  label11  |  label12   |
                otherLines
 |  label21  |  label22   |
                otherLines
 |  label31  |  label32   |
                otherLines
 -------------------------
 */


- (instancetype)initWithFrame:(CGRect)frame{
  if (self = [super initWithFrame:frame]) {
    
    self.backgroundColor = [UIColor blackColor];
    
    _label11 = [UILabel new];
    _label12 = [UILabel new];
    _label21 = [UILabel new];
    _label22 = [UILabel new];
    _label31 = [UILabel new];
    _label32 = [UILabel new];
    
    NSArray *labels =
     @[_label11, _label12, _label21, _label22, _label31, _label32, ];
    
    for (UILabel *l in labels) {
      [self addSubview:l];
      l.numberOfLines = 0;
      l.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255) / 255. green:arc4random_uniform(255) / 255. blue:arc4random_uniform(255) / 255. alpha:1.];
      
      l.text = @"AutoLayout TablViewHeaderView Test";
    }
    
    UIView *spv = self;
    [self.label11 setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [self.label11 mas_makeConstraints:^(MASConstraintMaker *make) {
      make.left.equalTo(spv.mas_leftMargin);
      make.top.equalTo(spv.mas_topMargin);
    }];
    
    [self.label12 setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    [self.label12 mas_makeConstraints:^(MASConstraintMaker *make) {
      make.left.equalTo(self.label11.mas_right);
      make.right.equalTo(spv.mas_rightMargin);
      make.top.equalTo(spv.mas_topMargin);
    }];
    
    [self.label21 setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [self.label21 mas_makeConstraints:^(MASConstraintMaker *make) {
      make.left.equalTo(spv.mas_leftMargin);
      make.top.equalTo(self.label12.mas_bottom);
    }];
    
    [self.label22 setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    [self.label22 mas_makeConstraints:^(MASConstraintMaker *make) {
      make.left.equalTo(self.label21.mas_right);
      make.right.equalTo(spv.mas_rightMargin);
      make.top.equalTo(self.label21.mas_top);
    }];
    
    [self.label31 setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [self.label31 mas_makeConstraints:^(MASConstraintMaker *make) {
      make.left.equalTo(spv.mas_leftMargin);
      make.top.equalTo(self.label22.mas_bottom);
    }];
    
    [self.label32 setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    [self.label32 mas_makeConstraints:^(MASConstraintMaker *make) {
      make.left.equalTo(self.label31.mas_right);
      make.right.equalTo(spv.mas_rightMargin);
      make.top.equalTo(self.label31.mas_top);
      make.bottom.equalTo(spv.mas_bottomMargin).priorityLow();
    }];
  }
  return self;
}

@end
