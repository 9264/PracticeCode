//
//  DownloadOperation.m
//  仿SDWeblmage
//
//  Created by 9264 on 16/8/20.
//  Copyright © 2016年 LY9264. All rights reserved.
//

#import "DownloadOperation.h"
@interface DownloadOperation ()

@property (copy, nonatomic) NSString *URLString;

@property (copy, nonatomic) void(^finishedBlock)(UIImage *image);

@end

@implementation DownloadOperation
- (void)main{
    // 延时
    [NSThread sleepForTimeInterval:1.0];
    NSURL *url = [NSURL URLWithString:self.URLString];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    
    //MARK:- 判断
    if (self.isCancelled) {
        return;
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
