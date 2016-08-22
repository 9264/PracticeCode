//
//  DownladManager.m
//  仿SDWeblmage
//
//  Created by 9264 on 16/8/22.
//  Copyright © 2016年 LY9264. All rights reserved.
//

#import "DownladManager.h"
#import "DownloadOperation.h"


@implementation DownladManager{

    NSOperationQueue *_queue;

    NSMutableDictionary *_OPCache;
}
+ (instancetype)sharedManager{
    static id instace;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instace = [self new];
    });
    return instace;
}

- (instancetype)init{
    
    if (self = [super init]) {
        _queue = [[NSOperationQueue alloc]init];
        _OPCache = [[NSMutableDictionary alloc]init];
    }
    
    return self;
}

- (void)downloadWithURLString:(NSString *)URLString finishedBlock:(void (^)(UIImage *))finishedBlock{
    if ([_OPCache objectForKey:URLString] != nil) {
        return;
    }

  
    DownloadOperation *op = [DownloadOperation downloadWithURLString:URLString finishedBlock:^(UIImage *image) {
        NSLog(@"%@ %@",image,[NSThread currentThread]);
        
        if (finishedBlock != nil) {
            finishedBlock(image);
        }
        
        [_OPCache removeObjectForKey:URLString];
    }];
    
    
    // 添加缓存池
    if (op != nil) {
        [_OPCache setObject:op forKey:URLString];
    }
    
    
    
    [_queue addOperation:op];
    
}
@end
