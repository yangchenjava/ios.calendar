//
//  UIImage+Category.m
//  ios_utils
//
//  Created by yangc on 16-1-28.
//  Copyright (c) 2016年 yangc. All rights reserved.
//

#import "UIImage+Category.h"

@implementation UIImage (Category)

/**
 * 图片拉伸
 */
+ (instancetype)imageNamedForResize:(NSString *)name {
    UIImage *image = [UIImage imageNamed:name];
    CGFloat w = image.size.width * 0.5;
    CGFloat h = image.size.height * 0.5;
    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(h, w, h, w)];
}

/**
 * 颜色图片
 */
+ (instancetype)imageWithColor:(UIColor *)color {
    CGFloat width = 1, height = 1;
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    [color set];
    UIRectFill(CGRectMake(0, 0, width, height));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

/**
 * 圆形图片
 */
- (instancetype)imageWithCircle:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    // 画圆
    CGContextAddArc(ctx, size.width * 0.5, size.height * 0.5, size.width * 0.5, 0, M_PI * 2, 0);
    CGContextClip(ctx);
    [self drawInRect:(CGRect){CGPointZero, size}];
    // 画边框
    CGContextSetLineWidth(ctx, 0.5);
    CGContextSetRGBStrokeColor(ctx, 210 / 255.0, 210 / 255.0, 210 / 255.0, 1);
    CGContextAddArc(ctx, size.width * 0.5, size.height * 0.5, size.width * 0.5 - 0.5, 0, M_PI * 2, 0);
    CGContextStrokePath(ctx);

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

/**
 * 圆角图片
 */
- (instancetype)imageWithRoundRect:(CGSize)size radius:(CGFloat)radius {
    UIGraphicsBeginImageContext(size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    // 画圆角矩形
    CGContextAddArc(ctx, radius, radius, radius, -M_PI, -M_PI_2, 0);
    CGContextAddArc(ctx, size.width - radius, radius, radius, -M_PI_2, 0, 0);
    CGContextAddArc(ctx, size.width - radius, size.height - radius, radius, 0, M_PI_2, 0);
    CGContextAddArc(ctx, radius, size.height - radius, radius, M_PI_2, M_PI, 0);
    CGContextClosePath(ctx);
    CGContextClip(ctx);
    [self drawInRect:(CGRect){CGPointZero, size}];
    // 画边框
    CGContextSetLineWidth(ctx, 0.5);
    CGContextSetRGBStrokeColor(ctx, 210 / 255.0, 210 / 255.0, 210 / 255.0, 1);
    CGContextAddArc(ctx, radius, radius, radius - 0.5, -M_PI, -M_PI_2, 0);
    CGContextAddArc(ctx, size.width - radius, radius, radius - 0.5, -M_PI_2, 0, 0);
    CGContextAddArc(ctx, size.width - radius, size.height - radius, radius - 0.5, 0, M_PI_2, 0);
    CGContextAddArc(ctx, radius, size.height - radius, radius - 0.5, M_PI_2, M_PI, 0);
    CGContextClosePath(ctx);
    CGContextStrokePath(ctx);

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
