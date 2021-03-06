//
//  DownloadOperation.m
//  仿SDWeblmage
//
//  Created by 9264 on 16/8/20.
//  Copyright © 2016年 LY9264. All rights reserved.
//

#import "DownloadOperation.h"
#import "NSString+path.h"
@interface DownloadOperation ()

@property (copy, nonatomic) NSString *URLString;

@property (copy, nonatomic) void(^finishedBlock)(UIImage *image);

@end

@implementation DownloadOperation
- (void)main{
    // 延时
    [NSThread sleepForTimeInterval:1.0];
    if (self.isCancelled) {
        return;
    }
    NSURL *url = [NSURL URLWithString:self.URLString];
    if (self.isCancelled) {
        return;
    }
    NSData *data = [NSData dataWithContentsOfURL:url];
    if (self.isCancelled) {
        return;
    }
    UIImage *image = [UIImage imageWithData:data];
    
    //- 判断
    if (self.isCancelled) {
        return;
    }
    
    //沙盒缓存
    if (image) {
        [data writeToFile:[self.URLString appendCachesPath] atomically:YES];
    }
    
   
    NSAssert(self.finishedBlock != nil, @"下载完成的回调不能为空!");
    [[NSOperationQueue mainQueue]addOperationWithBlock:^{
        self.finishedBlock(image);
    }];
}

+(instancetype)downloadWithURLString:(NSString *)URLString finishedBlock:(void (^)(UIImage *))finishedBlock{
    DownloadOperation *op = [[DownloadOperation alloc]init];
    op.URLString = URLString;
    op.finishedBlock = finishedBlock;
    return op;
}
@end
