//
//  YCHttpUtils.h
//  ios_utils
//
//  Created by yangc on 16-4-25.
//  Copyright (c) 2016年 yangc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YCHttpUtils : NSObject

+ (void)sendGet:(NSString *)URLString params:(id)params success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

+ (void)sendPost:(NSString *)URLString params:(id)params success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

+ (void)sendPost:(NSString *)URLString params:(id)params attachmentArray:(NSArray *)attachmentArray success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

@end

@interface YCAttachment : NSObject

@property (nonatomic, strong) NSData *data;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *fileName;
@property (nonatomic, copy) NSString *mimeType;

@end
