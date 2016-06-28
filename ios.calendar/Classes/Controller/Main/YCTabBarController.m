//
//  YCTabBarController.m
//  ios.calendar
//
//  Created by yangc on 16/6/23.
//  Copyright © 2016年 yangc. All rights reserved.
//

#import "YCDayViewController.h"
#import "YCMonthViewController.h"
#import "YCNavigationController.h"
#import "YCTabBar.h"
#import "YCTabBarController.h"

@interface YCTabBarController () <YCTabBarDelegate>

@property (nonatomic, weak) YCTabBar *mTabBar;

@end

@implementation YCTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTabBar];
    [self setupTabBarItem];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // 清空原有TabBar
    for (UIView *view in self.tabBar.subviews) {
        if ([view isKindOfClass:[UIControl class]]) {
            [view removeFromSuperview];
        }
    }
}

/**
 *  @author yangc, 16-06-23 15:06:32
 *
 *  初始化TabBar
 */
- (void)setupTabBar {
    YCTabBar *mTabBar = [[YCTabBar alloc] initWithFrame:self.tabBar.bounds];
    mTabBar.delegate = self;
    [self.tabBar addSubview:mTabBar];
    self.mTabBar = mTabBar;
}

/**
 *  @author yangc, 16-06-23 15:06:53
 *
 *  初始化TabBarItem
 */
- (void)setupTabBarItem {
    YCDayViewController *day = [[YCDayViewController alloc] init];
    [self addChildVC:day title:@"日视图" imageName:@"tab_day_normal" selectedImageName:@"tab_day_select" badgeValue:nil];

    YCMonthViewController *month = [[YCMonthViewController alloc] init];
    [self addChildVC:month title:@"月视图" imageName:@"tab_month_normal" selectedImageName:@"tab_month_select" badgeValue:nil];
}

- (void)addChildVC:(UIViewController *)vc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName badgeValue:(NSString *)badgeValue {
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:imageName];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    vc.tabBarItem.badgeValue = badgeValue;
    YCNavigationController *navi = [[YCNavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:navi];

    [self.mTabBar addTabBarItem:vc.tabBarItem];
}

- (void)tabBar:(YCTabBar *)tabBar didClickTabBarButtonFrom:(NSInteger)from to:(NSInteger)to {
    self.selectedIndex = to;
}

@end
