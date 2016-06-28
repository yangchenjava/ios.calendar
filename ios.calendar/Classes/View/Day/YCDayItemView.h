//
//  YCDayItemView.h
//  ios.calendar
//
//  Created by yangc on 16/6/23.
//  Copyright © 2016年 yangc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "YCDayModel.h"

@interface YCDayItemView : UIView

@property (nonatomic, strong) YCDayModel *dayModel;

+ (instancetype)dayViewWithFrame:(CGRect)frame;

@end
