//
//  YCDatePicker.h
//  ios.calendar
//
//  Created by yangc on 16/6/27.
//  Copyright © 2016年 yangc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YCDatePicker : UIDatePicker

+ (instancetype)datePickerWithMinimumDate:(NSDate *)minimumDate maximumDate:(NSDate *)maximumDate;

@end
