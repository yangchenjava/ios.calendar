//
//  YCMonthPicker.m
//  ios.calendar
//
//  Created by yangc on 16/6/28.
//  Copyright © 2016年 yangc. All rights reserved.
//

#import <DateTools/DateTools.h>

#import "YCMonthPicker.h"

@interface YCMonthPicker () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, assign) NSInteger minimumYear;
@property (nonatomic, assign) NSInteger maximumYear;

@end

@implementation YCMonthPicker

- (instancetype)initWithMinimumYear:(NSInteger)minimumYear maximumYear:(NSInteger)maximumYear {
    if (self = [super init]) {
        self.minimumYear = minimumYear;
        self.maximumYear = maximumYear;

        self.dataSource = self;
        self.delegate = self;
        [self selectRow:[NSDate date].year - self.minimumYear inComponent:0 animated:NO];
        [self selectRow:[NSDate date].month - 1 inComponent:1 animated:NO];
    }
    return self;
}

- (NSDate *)date {
    return [NSDate dateWithYear:[self selectedRowInComponent:0] + self.minimumYear month:[self selectedRowInComponent:1] + 1 day:1];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return component == 0 ? self.maximumYear - self.minimumYear + 1 : 12;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return component == 0 ? [NSString stringWithFormat:@"%ld年", self.minimumYear + row] : [NSString stringWithFormat:@"%ld月", row + 1];
}

@end
