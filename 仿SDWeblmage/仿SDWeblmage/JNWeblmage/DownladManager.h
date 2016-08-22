//
//  DownladManager.h
//  仿SDWeblmage
//
//  Created by 9264 on 16/8/22.
//  Copyright © 2016年 LY9264. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface DownladManager : NSObject
+ (instancetype)sharedManager;

- (void)downloadWithURLString:(NSString *)URLString finishedBlock:(void(^)(UIImage *image))finishedBlock;
@end
