//
//  YCDayModel.h
//  ios.calendar
//
//  Created by yangc on 16/6/23.
//  Copyright © 2016年 yangc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YCDayModel : NSObject

/**
 *  中国年
 */
@property (nonatomic, copy) NSString *chineseYear;

/**
 *  中国月
 */
@property (nonatomic, copy) NSString *chineseMonth;

/**
 *  周
 */
@property (nonatomic, copy) NSString *week;

/**
 *  日期
 */
@property (nonatomic, copy) NSString *day;

+ (instancetype)dayModelWithDate:(NSDate *)date;

@end
