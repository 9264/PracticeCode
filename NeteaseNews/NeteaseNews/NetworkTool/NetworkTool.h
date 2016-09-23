//
//  NetworkTool.h
//  NeteaseNews
//
//  Created by 9264 on 16/9/2.
//  Copyright © 2016年 LY9264. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
@interface NetworkTool : AFHTTPSessionManager
+ (instancetype)sharedNetworkTool;

- (void)GETWithURLString1:(NSString *)URLString parameters:(id)parameters progress:(void(^)(NSProgress * downloadProgress))progress success:(void (^)(id))success faile:(void (^)(NSError *))faile;

- (void)GETWithURLString2:(NSString *)URLString success:(void (^)(id))success faile:(void (^)(NSError *))faile;

@end
