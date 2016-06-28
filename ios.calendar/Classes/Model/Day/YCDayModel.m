//
//  YCDayModel.m
//  ios.calendar
//
//  Created by yangc on 16/6/23.
//  Copyright © 2016年 yangc. All rights reserved.
//

#import <DateTools/DateTools.h>

#import "YCChineseCalendar.h"
#import "YCDayModel.h"

@implementation YCDayModel

static NSCalendar *_chineseCalendar;

+ (void)initialize {
    _chineseCalendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierChinese];
}

+ (instancetype)dayModelWithDate:(NSDate *)date {
    NSString *chineseYear = [YCChineseCalendar chineseYearNameWithChineseYear:[date yearWithCalendar:_chineseCalendar]];
    NSString *chineseAnimal = [YCChineseCalendar chineseAnimalNameWithChineseYear:[date yearWithCalendar:_chineseCalendar]];
    NSString *chineseMonth = [YCChineseCalendar chineseMonthNameWithChineseMonth:[date monthWithCalendar:_chineseCalendar]];
    NSString *chineseDay = [YCChineseCalendar chineseDayNameWithChineseDay:[date dayWithCalendar:_chineseCalendar]];
    NSString *week = [YCChineseCalendar weekNameWithWeek:date.weekday];
    NSString *day = [NSString stringWithFormat:@"%ld", date.day];

    YCDayModel *dayModel = [[YCDayModel alloc] init];
    dayModel.chineseYear = [NSString stringWithFormat:@"%@年[%@年]", chineseYear, chineseAnimal];
    dayModel.chineseMonth = [NSString stringWithFormat:@"农历%@%@", chineseMonth, chineseDay];
    dayModel.week = week;
    dayModel.day = day;
    return dayModel;
}

@end
