//
//  YCDayViewController.m
//  ios.calendar
//
//  Created by yangc on 16/6/23.
//  Copyright © 2016年 yangc. All rights reserved.
//

#import <DateTools/DateTools.h>
#import <Masonry/Masonry.h>

#import "UIView+Category.h"
#import "YCAlertControllerBiz.h"
#import "YCChineseCalendar.h"
#import "YCDatePicker.h"
#import "YCDayItemView.h"
#import "YCDayModel.h"
#import "YCDayViewController.h"
#import "YCScrollView.h"
#import "YCTitleButton.h"

@interface YCDayViewController () <UIScrollViewDelegate>

@property (nonatomic, assign) long centerIndex;
@property (nonatomic, strong) UIAlertController *alertController;

@property (nonatomic, weak) YCTitleButton *titleButton;
@property (nonatomic, weak) YCScrollView *scrollView;

@end

@implementation YCDayViewController

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
 *  @author yangc, 16-06-27 16:06:56
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
 *  @author yangc, 16-06-27 16:06:34
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

    for (int i = 0; i < 3; i++) {
        NSTimeInterval timeInterval = (i - 1) * 60 * 60 * 24;
        NSDate *date = [NSDate dateWithTimeIntervalSinceNow:timeInterval];

        YCDayItemView *dayView = [YCDayItemView dayViewWithFrame:CGRectMake(i * svWidth, 0, svWidth, svHeight)];
        dayView.dayModel = [YCDayModel dayModelWithDate:date];
        [self.scrollView addSubview:dayView];
    }
}

/**
 *  @author yangc, 16-06-27 22:06:21
 *
 *  加载数据
 *
 *  @param titleDate
 */
- (void)loadDataWithTitleDate:(NSDate *)titleDate {
    [self.titleButton setTitle:[titleDate formattedDateWithFormat:@"yyyy-MM"] forState:UIControlStateNormal];

    for (int i = 0; i < self.scrollView.subviews.count; i++) {
        NSTimeInterval timeInterval = (i - 1 + self.centerIndex) * 60 * 60 * 24;
        NSDate *date = [NSDate dateWithTimeIntervalSinceNow:timeInterval];

        YCDayItemView *dayView = [self.scrollView.subviews objectAtIndex:i];
        dayView.dayModel = [YCDayModel dayModelWithDate:date];
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

    [self loadDataWithTitleDate:[NSDate dateWithTimeIntervalSinceNow:self.centerIndex * 60 * 60 * 24]];
}

- (UIAlertController *)alertController {
    if (_alertController == nil) {
        NSDate *minimumDate = [NSDate dateWithYear:START_YEAR month:1 day:1];
        NSDate *maximumDate = [NSDate dateWithYear:END_YEAR month:12 day:31];
        YCDatePicker *datePicker = [YCDatePicker datePickerWithMinimumDate:minimumDate maximumDate:maximumDate];

        _alertController = [YCAlertControllerBiz alertControllerWithPickerView:datePicker
            settingAction:^{
                NSDate *today = [NSDate date];
                NSDate *selectDate = datePicker.date;
                if ([today isEarlierThan:selectDate]) {
                    self.centerIndex = [today daysEarlierThan:selectDate] + 1;
                } else if ([today isSameDay:selectDate]) {
                    self.centerIndex = 0;
                } else {
                    self.centerIndex = -[today daysLaterThan:selectDate];
                }

                [self loadDataWithTitleDate:selectDate];
            }
            todayAction:^{
                self.centerIndex = 0;

                [self loadDataWithTitleDate:[NSDate date]];
            }];
    }
    return _alertController;
}

@end
