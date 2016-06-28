//
//  YCMonthItemView.h
//  ios.calendar
//
//  Created by yangc on 16/6/24.
//  Copyright © 2016年 yangc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YCMonthItemView : UIView

@property (nonatomic, strong) NSArray *monthModelArray;

+ (instancetype)monthViewWithFrame:(CGRect)frame;

@end
