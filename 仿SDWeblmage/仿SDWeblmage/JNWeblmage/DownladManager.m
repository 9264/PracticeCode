//
//  DownladManager.m
//  仿SDWeblmage
//
//  Created by 9264 on 16/8/22.
//  Copyright © 2016年 LY9264. All rights reserved.
//

#import "DownladManager.h"
#import "DownloadOperation.h"
#import "NSString+path.h"


@implementation DownladManager{

    NSOperationQueue *_queue;

    NSMutableDictionary *_OPCache;
    
    NSMutableDictionary *_imagesCache;
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
        _imagesCache = [[NSMutableDictionary alloc]init];
    }
    
    return self;
}

- (void)downloadWithURLString:(NSString *)URLString finishedBlock:(void (^)(UIImage *))finishedBlock{
    
    
    // 判断有没有缓存
    if ([self checkCacheWithURLString:URLString]) {
        
        // 从内存缓存里面取出图片,回调到控制器
        if (finishedBlock) {
            finishedBlock([_imagesCache objectForKey:URLString]);
        }
        
        return;
    }
    
    if ([_OPCache objectForKey:URLString] != nil) {
        return;
    }

  
    DownloadOperation *op = [DownloadOperation downloadWithURLString:URLString finishedBlock:^(UIImage *image) {
        NSLog(@"%@ %@",image,[NSThread currentThread]);
        
        if (finishedBlock != nil) {
            finishedBlock(image);
            
            
            //MARK:- 田添加缓存池
//            [_imagesCache set]
            
        }
        
        [_OPCache removeObjectForKey:URLString];
    }];
    
    
    // 添加缓存池
    if (op != nil) {
        [_OPCache setObject:op forKey:URLString];
    }
    
    
    
    [_queue addOperation:op];
    
}

- (BOOL)checkCacheWithURLString:(NSString *)URLString{
    //判断
    if ([_imagesCache objectForKey:URLString] != nil) {
        NSLog(@"从内存中加载...");
        return YES;
    }
    
    UIImage *cacheImage = [UIImage imageWithContentsOfFile:[URLString appendCachesPath]];
    if (cacheImage) {
        NSLog(@"从沙盒中加载...");
        
        [_imagesCache setObject:cacheImage forKey:URLString];
        
        return YES;
    }

    
    return NO;
}




- (void)cancelWithLastRULStrig:(NSString *)lastRULStrig{
    DownloadOperation *lastOP = [_OPCache objectForKey:lastRULStrig];
    if (lastOP != nil) {
        [lastOP cancel];
        [_OPCache removeObjectForKey:lastRULStrig];
    }
   
}
@end
