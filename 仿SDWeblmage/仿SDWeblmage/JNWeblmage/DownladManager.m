//
//  DownladManager.m
//  仿SDWeblmage
//
//  Created by 9264 on 16/8/22.
//  Copyright © 2016年 LY9264. All rights reserved.
//

#import "DownladManager.h"

@implementation DownladManager
+ (instancetype)sharedManager{
    static id instace;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instace = [self new];
    });
    return instace;
}
@end
