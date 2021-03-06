//
//  YCNavigationController.m
//  ios.calendar
//
//  Created by yangc on 16/6/23.
//  Copyright © 2016年 yangc. All rights reserved.
//

#import "YCNavigationController.h"

@interface YCNavigationController ()

@end

@implementation YCNavigationController

+ (void)initialize {
    [super initialize];
    [self setupNaviTitleStyle];
    [self setupNaviBarButtonItemStyle];
}

/**
 *  @author yangc, 16-06-23 15:06:19
 *
 *  初始化导航标题样式
 */
+ (void)setupNaviTitleStyle {
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowOffset = CGSizeZero; // 去掉阴影
    NSDictionary *titleTextAttributes = @{NSFontAttributeName : [UIFont boldSystemFontOfSize:20], NSForegroundColorAttributeName : YC_COLOR(13, 79, 139), NSShadowAttributeName : shadow};

    UINavigationBar *naviBar = [UINavigationBar appearance];
    naviBar.titleTextAttributes = titleTextAttributes;

    // 回退图片颜色
    naviBar.tintColor = YC_COLOR(13, 79, 139);
}

/**
 *  @author yangc, 16-06-23 15:06:27
 *
 *  初始化导航按钮样式
 */
+ (void)setupNaviBarButtonItemStyle {
    NSDictionary *titleTextAttributes = @{NSFontAttributeName : [UIFont boldSystemFontOfSize:16], NSForegroundColorAttributeName : YC_COLOR(9, 69, 133)};

    UIBarButtonItem *barButtonItem = [UIBarButtonItem appearance];
    [barButtonItem setTitleTextAttributes:titleTextAttributes forState:UIControlStateNormal];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.childViewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;

        viewController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:nil action:nil];
    }
    [super pushViewController:viewController animated:animated];
}

@end
