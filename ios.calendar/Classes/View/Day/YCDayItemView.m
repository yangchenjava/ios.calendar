//
//  YCDayView.m
//  ios.calendar
//
//  Created by yangc on 16/6/23.
//  Copyright © 2016年 yangc. All rights reserved.
//

#import "YCDayItemView.h"

@interface YCDayItemView ()

@property (weak, nonatomic) IBOutlet UILabel *dayLabel;
@property (weak, nonatomic) IBOutlet UILabel *chineseYearLabel;
@property (weak, nonatomic) IBOutlet UILabel *chineseMonthLabel;
@property (weak, nonatomic) IBOutlet UILabel *weekLabel;

@end

@implementation YCDayItemView

+ (instancetype)dayViewWithFrame:(CGRect)frame {
    YCDayItemView *dayView = [[NSBundle mainBundle] loadNibNamed:@"YCDayItemView" owner:nil options:nil].lastObject;
    dayView.frame = frame;
    return dayView;
}

- (void)setDayModel:(YCDayModel *)dayModel {
    _dayModel = dayModel;

    self.dayLabel.text = self.dayModel.day;
    self.chineseYearLabel.text = self.dayModel.chineseYear;
    self.chineseMonthLabel.text = self.dayModel.chineseMonth;
    self.weekLabel.text = self.dayModel.week;
}

@end
