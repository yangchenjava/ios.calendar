//
//  YCMonthItemView.m
//  ios.calendar
//
//  Created by yangc on 16/6/24.
//  Copyright © 2016年 yangc. All rights reserved.
//

#import "NSString+Category.h"
#import "UIView+Category.h"
#import "YCMonthItemView.h"
#import "YCMonthModel.h"

#define kDayFont [UIFont boldSystemFontOfSize:17]

@interface YCMonthItemView ()

@property (weak, nonatomic) IBOutlet UIView *dateView;

@property (nonatomic, assign) CGFloat dayLabelH;

@end

@implementation YCMonthItemView

+ (instancetype)monthViewWithFrame:(CGRect)frame {
    YCMonthItemView *monthView = [[NSBundle mainBundle] loadNibNamed:@"YCMonthItemView" owner:nil options:nil].lastObject;
    monthView.frame = frame;
    return monthView;
}

/**
 *  @author yangc, 16-06-26 13:06:29
 *
 *  创建label
 */
- (void)awakeFromNib {
    [super awakeFromNib];

    self.dayLabelH = [@"1" sizeWithFont:kDayFont size:CGSizeMake(MAXFLOAT, MAXFLOAT)].height;
    for (int i = 0; i < 42; i++) {
        UILabel *dayLabel = [[UILabel alloc] init];
        dayLabel.textAlignment = NSTextAlignmentCenter;
        dayLabel.font = kDayFont;

        UILabel *chineseDayLabel = [[UILabel alloc] init];
        chineseDayLabel.textAlignment = NSTextAlignmentCenter;
        chineseDayLabel.font = [UIFont systemFontOfSize:11];

        UIView *dayView = [[UIView alloc] init];
        [dayView addSubview:dayLabel];
        [dayView addSubview:chineseDayLabel];

        [self.dateView addSubview:dayView];
    }
}

/**
 *  @author yangc, 16-06-26 13:06:02
 *
 *  计算frame
 */
- (void)layoutSubviews {
    [super layoutSubviews];

    CGFloat dateViewW = self.dateView.width / 7;
    CGFloat dateViewH = self.dateView.height / 6;

    CGFloat dayLabelX = 0;
    CGFloat dayLabelY = dateViewH / 2 - self.dayLabelH;
    CGFloat dayLabelW = dateViewW;
    CGFloat dayLabelH = self.dayLabelH;

    CGFloat chineseDayLabelX = 0;
    CGFloat chineseDayLabelY = dateViewH / 2;
    CGFloat chineseDayLabelW = dateViewW;
    CGFloat chineseDayLabelH = chineseDayLabelY;

    [self.dateView.subviews enumerateObjectsUsingBlock:^(UIView *dayView, NSUInteger idx, BOOL *stop) {
        CGFloat dayViewX = idx % 7 * dateViewW;
        CGFloat dayViewY = idx / 7 * dateViewH;
        dayView.frame = CGRectMake(dayViewX, dayViewY, dateViewW, dateViewH);

        UILabel *dayLabel = dayView.subviews[0];
        dayLabel.frame = CGRectMake(dayLabelX, dayLabelY, dayLabelW, dayLabelH);

        UILabel *chineseDayLabel = dayView.subviews[1];
        chineseDayLabel.frame = CGRectMake(chineseDayLabelX, chineseDayLabelY, chineseDayLabelW, chineseDayLabelH);
    }];
}

/**
 *  @author yangc, 16-06-26 13:06:13
 *
 *  赋值
 *
 *  @param monthModelArray
 */
- (void)setMonthModelArray:(NSArray *)monthModelArray {
    _monthModelArray = monthModelArray;

    [self.dateView.subviews enumerateObjectsUsingBlock:^(UIView *dayView, NSUInteger idx, BOOL *stop) {
        YCMonthModel *monthModel = [self.monthModelArray objectAtIndex:idx];

        UILabel *dayLabel = dayView.subviews[0];
        dayLabel.text = monthModel.day;
        UILabel *chineseDayLabel = dayView.subviews[1];
        chineseDayLabel.text = monthModel.chineseDay;

        switch (monthModel.monthState) {
            case NotCurrentMonth:
                dayView.backgroundColor = [UIColor whiteColor];
                dayLabel.textColor = YC_COLOR(204, 204, 204);
                chineseDayLabel.textColor = YC_COLOR(204, 204, 204);
                break;
            case Today:
                dayView.backgroundColor = YC_COLOR(178, 228, 255);
                dayLabel.textColor = YC_COLOR(36, 149, 255);
                chineseDayLabel.textColor = YC_COLOR(36, 149, 255);
                break;
            case CurrentMonthNotToday:
                dayView.backgroundColor = [UIColor whiteColor];
                dayLabel.textColor = monthModel.isWeekend ? [UIColor redColor] : [UIColor blackColor];
                chineseDayLabel.textColor = monthModel.isFestival ? YC_COLOR(30, 153, 78) : [UIColor blackColor];
                break;
        }
    }];
}

@end
