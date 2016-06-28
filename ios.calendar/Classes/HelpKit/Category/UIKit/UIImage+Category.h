//
//  UIImage+Category.h
//  ios_utils
//
//  Created by yangc on 16-1-28.
//  Copyright (c) 2016年 yangc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Category)

/**
 * 图片拉伸
 */
+ (instancetype)imageNamedForResize:(NSString *)name;

/**
 * 颜色图片
 */
+ (instancetype)imageWithColor:(UIColor *)color;

/**
 * 圆形图片
 */
- (instancetype)imageWithCircle:(CGSize)size;

/**
 * 圆角图片
 */
- (instancetype)imageWithRoundRect:(CGSize)size radius:(CGFloat)radius;

@end
