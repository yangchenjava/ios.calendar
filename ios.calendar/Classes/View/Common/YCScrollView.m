//
//  YCScrollView.m
//  ios.calendar
//
//  Created by yangc on 16/6/27.
//  Copyright © 2016年 yangc. All rights reserved.
//

#import "YCScrollView.h"

@implementation YCScrollView

+ (instancetype)scrollViewWithFrame:(CGRect)frame {
    YCScrollView *scrollView = [[YCScrollView alloc] initWithFrame:frame];
    // 取消回弹效果
    scrollView.bounces = NO;
    scrollView.contentSize = CGSizeMake(frame.size.width * 3, 0);
    scrollView.contentOffset = CGPointMake(frame.size.width, 0);
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    return scrollView;
}

@end
