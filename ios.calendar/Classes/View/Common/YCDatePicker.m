//
//  YCDatePicker.m
//  ios.calendar
//
//  Created by yangc on 16/6/27.
//  Copyright © 2016年 yangc. All rights reserved.
//

#import "YCDatePicker.h"

@implementation YCDatePicker

+ (instancetype)datePickerWithMinimumDate:(NSDate *)minimumDate maximumDate:(NSDate *)maximumDate {
    YCDatePicker *datePicker = [[YCDatePicker alloc] init];
    datePicker.minimumDate = minimumDate;
    datePicker.maximumDate = maximumDate;
    datePicker.datePickerMode = UIDatePickerModeDate;
    datePicker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    return datePicker;
}

@end
