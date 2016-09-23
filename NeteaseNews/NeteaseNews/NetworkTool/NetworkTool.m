//
//  NetworkTool.m
//  NeteaseNews
//
//  Created by 9264 on 16/9/2.
//  Copyright © 2016年 LY9264. All rights reserved.
//

#import "NetworkTool.h"

@implementation NetworkTool
+ (instancetype)sharedNetworkTool
{
    static NetworkTool *instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{

        NSURL *BaseURL = [NSURL URLWithString:@"http://c.m.163.com/nc/"];

        instance = [[self alloc] initWithBaseURL:BaseURL];

        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/plain", nil];
    });
    
    return instance;
}

- (void)GETWithURLString1:(NSString *)URLString parameters:(id)parameters progress:(void(^)(NSProgress * downloadProgress))progress success:(void (^)(id))success faile:(void (^)(NSError *))faile
{
    [self GET:URLString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress){
        if (progress) {
            progress(downloadProgress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success) {
            success(responseObject);
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (faile) {
            faile(error);
        }
    }];
  
}

- (void)GETWithURLString2:(NSString *)URLString success:(void (^)(id))success faile:(void (^)(NSError *))faile
{
    [self GET:URLString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success) {
            success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (faile) {
            faile(error);
        }
    }];
}


@end
