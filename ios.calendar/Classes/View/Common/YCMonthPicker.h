//
//  YCMonthPicker.h
//  ios.calendar
//
//  Created by yangc on 16/6/28.
//  Copyright © 2016年 yangc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YCMonthPicker : UIPickerView

@property (nonatomic, strong, readonly) NSDate *date;

- (instancetype)initWithMinimumYear:(NSInteger)minimumYear maximumYear:(NSInteger)maximumYear;

@end
