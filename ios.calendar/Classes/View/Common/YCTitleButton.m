//
//  YCTitleButton.m
//  ios.calendar
//
//  Created by yangc on 16/6/27.
//  Copyright © 2016年 yangc. All rights reserved.
//

#import "NSString+Category.h"
#import "YCTitleButton.h"

@implementation YCTitleButton

+ (instancetype)titleButtonWithTitle:(NSString *)title {
    YCTitleButton *titleButton = [YCTitleButton buttonWithType:UIButtonTypeCustom];
    titleButton.titleLabel.font = [UIFont systemFontOfSize:21];
    CGSize size = [title sizeWithFont:titleButton.titleLabel.font size:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    titleButton.bounds = CGRectMake(0, 0, size.width + 10, size.height);
    [titleButton setTitle:title forState:UIControlStateNormal];
    [titleButton setTitleColor:YC_COLOR(13, 79, 139) forState:UIControlStateNormal];
    return titleButton;
}

@end
