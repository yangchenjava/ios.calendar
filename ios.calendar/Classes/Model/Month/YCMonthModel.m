//
//  YCMonthModel.m
//  ios.calendar
//
//  Created by yangc on 16/6/23.
//  Copyright © 2016年 yangc. All rights reserved.
//

#import <DateTools/DateTools.h>

#import "YCChineseCalendar.h"
#import "YCMonthModel.h"

@implementation YCMonthModel

static NSCalendar *_chineseCalendar;

+ (void)initialize {
    _chineseCalendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierChinese];
}

+ (NSArray *)monthModelArrayWithDate:(NSDate *)date {
    NSInteger currentMonth = date.month;

    if (date.weekday != 1) {
        date = [date dateBySubtractingDays:date.weekday - 1];
    }

    int length = 42;
    NSMutableArray *monthModelArray = [NSMutableArray arrayWithCapacity:length];
    for (int i = 0; i < length; i++) {
        YCMonthModel *monthModel = [[YCMonthModel alloc] init];
        monthModel.day = [NSString stringWithFormat:@"%ld", date.day];

        NSDate *tempDate = [date dateByAddingDays:1];
        NSString *festivalName = [YCChineseCalendar festivalNameWithDate:[date formattedDateWithFormat:@"MMdd"]];
        NSString *chineseTermName = [YCChineseCalendar chineseTermNameWithYear:date.year month:date.month day:date.day];
        if ([tempDate monthWithCalendar:_chineseCalendar] == 1 && [tempDate dayWithCalendar:_chineseCalendar] == 1) {
            monthModel.chineseDay = @"除夕";
            monthModel.festival = YES;
        } else if (festivalName) {
            monthModel.chineseDay = festivalName;
            monthModel.festival = YES;
        } else if (chineseTermName) {
            monthModel.chineseDay = chineseTermName;
            monthModel.festival = YES;
        } else {
            NSInteger chineseMonth = [date monthWithCalendar:_chineseCalendar];
            NSInteger chineseDay = [date dayWithCalendar:_chineseCalendar];
            NSString *chineseMonthName = [YCChineseCalendar chineseMonthNameWithChineseMonth:chineseMonth];
            NSString *chineseDayName = [YCChineseCalendar chineseDayNameWithChineseDay:chineseDay];
            festivalName = [YCChineseCalendar festivalNameWithDate:[NSString stringWithFormat:@"%@%@", chineseMonthName, chineseDayName]];
            if (festivalName) {
                monthModel.chineseDay = festivalName;
                monthModel.festival = YES;
            } else {
                monthModel.chineseDay = chineseDay == 1 ? chineseMonthName : chineseDayName;
                monthModel.festival = NO;
            }
        }

        monthModel.monthState = date.month != currentMonth ? NotCurrentMonth : date.isToday ? Today : CurrentMonthNotToday;
        monthModel.weekend = date.isWeekend;
        [monthModelArray addObject:monthModel];
        date = [date dateByAddingDays:1];
    }
    return monthModelArray;
}

@end
