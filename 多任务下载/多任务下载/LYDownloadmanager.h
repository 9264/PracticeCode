//
//  LYDownloadmanager.h
//  多任务下载
//
//  Created by 9264 on 16/8/31.
//  Copyright © 2016年 LY9264. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYDownloadmanager : NSObject
+ (instancetype)sharedManager;
- (void)downloadWithURLString:(NSString *)URLString progressBlock:(void(^)(float progress))progressBlock completionBlock:(void(^)(NSString *filePath))completionBlock;
@end
