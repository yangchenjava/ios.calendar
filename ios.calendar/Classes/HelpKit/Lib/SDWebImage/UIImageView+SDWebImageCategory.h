//
//  UIImageView+SDWebImageCategory.h
//  ios_utils
//
//  Created by yangc on 16-4-19.
//  Copyright (c) 2016年 yangc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (SDWebImageCategory)

- (void)sd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder radius:(CGFloat)radius;

@end
