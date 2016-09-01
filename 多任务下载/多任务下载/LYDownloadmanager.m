//
//  LYDownloadmanager.m
//  多任务下载
//
//  Created by 9264 on 16/8/31.
//  Copyright © 2016年 LY9264. All rights reserved.
//

#import "LYDownloadmanager.h"

@interface LYDownloadmanager()<NSURLSessionDownloadDelegate>

@end

@implementation LYDownloadmanager{
    NSURLSession *_downloadSession;
    NSMutableDictionary *_progressBlockDict;
}

+(instancetype)sharedManager{

    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
    });
    
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        _downloadSession = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:nil];
    }
    return self;
}
#pragma mark - 下载文件主方法
- (void)downloadWithURLString:(NSString *)URLString progressBlock:(void (^)(float))progressBlock completionBlock:(void (^)(NSString *))completionBlock{
    NSURL *url = [NSURL URLWithString:URLString];
    
    NSURLSessionDownloadTask *downloadTask = [_downloadSession downloadTaskWithURL:url];
    [downloadTask resume];
    
     [_progressBlockDict setObject:progressBlock forKey:downloadTask];

}

#pragma mark - 监听文件下载进度
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
      didWriteData:(int64_t)bytesWritten
 totalBytesWritten:(int64_t)totalBytesWritten
totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite
{
    float progress = (float)totalBytesWritten / totalBytesExpectedToWrite;
//    NSLog(@"下载的进度 DownloadManager %f",progress);
    void (^progressBlock)(float) = [_progressBlockDict objectForKey:downloadTask];
    if (progressBlock) {
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
           progressBlock(progress);
        }];
    }
}


#pragma mark - 监听文件下载完成
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
didFinishDownloadingToURL:(NSURL *)location
{
    NSLog(@"小铭要的.avi下载结束 DownloadManager %@",location.path);
}

@end
