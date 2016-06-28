//
//  YCMonthViewController.m
//  ios.calendar
//
//  Created by yangc on 16/6/23.
//  Copyright © 2016年 yangc. All rights reserved.
//

#import <DateTools/DateTools.h>

#import "UIView+Category.h"
#import "YCAlertControllerBiz.h"
#import "YCChineseCalendar.h"
#import "YCMonthItemView.h"
#import "YCMonthModel.h"
#import "YCMonthPicker.h"
#import "YCMonthViewController.h"
#import "YCScrollView.h"
#import "YCTitleButton.h"

@interface YCMonthViewController () <UIScrollViewDelegate>

@property (nonatomic, assign) long centerIndex;
@property (nonatomic, strong) UIAlertController *alertController;

@property (nonatomic, weak) YCTitleButton *titleButton;
@property (nonatomic, weak) YCScrollView *scrollView;

@end

@implementation YCMonthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // ios7 导航控制器切换影响UIScrollView布局的问题
    self.automaticallyAdjustsScrollViewInsets = NO;

    self.view.backgroundColor = YC_COLOR(212, 212, 212);

    self.centerIndex = 0;

    // 标题按钮
    [self setupTitleButton];

    // 滑动视图
    [self setupScrollView];
}

/**
 *  @author yangc, 16-06-28 09:06:49
 *
 *  标题按钮
 */
- (void)setupTitleButton {
    YCTitleButton *titleButton = [YCTitleButton titleButtonWithTitle:[[NSDate date] formattedDateWithFormat:@"yyyy-MM"]];
    [titleButton addTarget:self action:@selector(clickTitleButton) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = titleButton;
    self.titleButton = titleButton;
}

/**
 *  @author yangc, 16-06-28 09:06:47
 *
 *  滑动视图
 */
- (void)setupScrollView {
    CGFloat svX = 0;
    CGFloat svY = [UIApplication sharedApplication].statusBarFrame.size.height + self.navigationController.navigationBar.height;
    CGFloat svWidth = self.view.width;
    CGFloat svHeight = self.view.height - svY - self.tabBarController.tabBar.height;
    YCScrollView *scrollView = [YCScrollView scrollViewWithFrame:CGRectMake(svX, svY, svWidth, svHeight)];
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;

    NSDate *date = [NSDate date];
    for (int i = 0; i < 3; i++) {
        YCMonthItemView *monthView = [YCMonthItemView monthViewWithFrame:CGRectMake(i * svWidth, 0, svWidth, svHeight)];
        monthView.monthModelArray = [YCMonthModel monthModelArrayWithDate:[[NSDate dateWithYear:date.year month:date.month day:1] dateByAddingMonths:i - 1]];
        [self.scrollView addSubview:monthView];
    }
}

/**
 *  @author yangc, 16-06-28 11:06:17
 *
 *  加载数据
 *
 *  @param titleDate
 */
- (void)loadDataWithDate:(NSDate *)date {
    [self.titleButton setTitle:[date formattedDateWithFormat:@"yyyy-MM"] forState:UIControlStateNormal];

    for (int i = 0; i < self.scrollView.subviews.count; i++) {
        YCMonthItemView *monthView = [self.scrollView.subviews objectAtIndex:i];
        monthView.monthModelArray = [YCMonthModel monthModelArrayWithDate:[[NSDate dateWithYear:date.year month:date.month day:1] dateByAddingMonths:i - 1]];
    }
    self.scrollView.contentOffset = CGPointMake(self.scrollView.width, 0);
}

- (void)clickTitleButton {
    [self presentViewController:self.alertController animated:YES completion:nil];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat offsetX = scrollView.contentOffset.x;

    if (offsetX == 0) {
        self.centerIndex--;
    } else if (offsetX == scrollView.width * 2) {
        self.centerIndex++;
    }

    NSDate *date = [[NSDate date] dateByAddingMonths:self.centerIndex];
    [self loadDataWithDate:date];
}

- (UIAlertController *)alertController {
    if (_alertController == nil) {
        YCMonthPicker *monthPicker = [[YCMonthPicker alloc] initWithMinimumYear:START_YEAR maximumYear:END_YEAR];

        _alertController = [YCAlertControllerBiz alertControllerWithPickerView:monthPicker
            settingAction:^{
                NSDate *date = [NSDate date];
                NSDate *today = [NSDate dateWithYear:date.year month:date.month day:1];
                NSDate *selectDate = monthPicker.date;
                if ([today isEarlierThan:selectDate]) {
                    self.centerIndex = [today monthsEarlierThan:selectDate] + 1;
                } else if ([today isSameDay:selectDate]) {
                    self.centerIndex = 0;
                } else {
                    self.centerIndex = -[today monthsLaterThan:selectDate];
                }

                [self loadDataWithDate:selectDate];
            }
            todayAction:^{
                self.centerIndex = 0;

                [self loadDataWithDate:[NSDate date]];
            }];
    }
    return _alertController;
}

@end
