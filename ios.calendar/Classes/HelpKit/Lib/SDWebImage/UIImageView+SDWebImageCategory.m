//
//  UIImageView+SDWebImageCategory.m
//  ios_utils
//
//  Created by yangc on 16-4-19.
//  Copyright (c) 2016年 yangc. All rights reserved.
//

#import <SDWebImage/UIImageView+WebCache.h>

#import "UIImage+Category.h"
#import "UIImageView+SDWebImageCategory.h"

@implementation UIImageView (SDWebImageCategory)

- (void)sd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder radius:(CGFloat)radius {
    if (radius) {
        NSString *key = [url.absoluteString stringByAppendingString:@"_radius"];
        UIImage *cacheImage = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:key];
        if (cacheImage) {
            self.image = cacheImage;
        } else {
            [self sd_setImageWithURL:url
                    placeholderImage:placeholder
                           completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                               if (!error) {
                                   UIImage *newImage = [image imageWithRoundRect:self.frame.size radius:radius];
                                   self.image = newImage;
                                   [[SDImageCache sharedImageCache] storeImage:newImage forKey:key];
                                   [[SDImageCache sharedImageCache] removeImageForKey:url.absoluteString];
                               }
                           }];
        }
    } else {
        [self sd_setImageWithURL:url placeholderImage:placeholder];
    }
}

@end
