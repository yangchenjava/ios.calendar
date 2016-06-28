//
//  YCMonthModel.h
//  ios.calendar
//
//  Created by yangc on 16/6/23.
//  Copyright © 2016年 yangc. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum { NotCurrentMonth, Today, CurrentMonthNotToday } MonthState;

@interface YCMonthModel : NSObject

/**
 *  日期
 */
@property (nonatomic, copy) NSString *day;

/**
 *  中国日期
 */
@property (nonatomic, copy) NSString *chineseDay;

/**
 *  月状态
 */
@property (nonatomic, assign) MonthState monthState;

/**
 *  是否周末
 */
@property (nonatomic, assign, getter=isWeekend) BOOL weekend;

/**
 *  是否节日
 */
@property (nonatomic, assign, getter=isFestival) BOOL festival;

+ (NSArray *)monthModelArrayWithDate:(NSDate *)date;

@end
