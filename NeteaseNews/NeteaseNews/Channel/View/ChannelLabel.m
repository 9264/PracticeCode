//
//  ChannelLabel.m
//  NeteaseNews
//
//  Created by 9264 on 16/9/1.
//  Copyright © 2016年 LY9264. All rights reserved.
//

#import "ChannelLabel.h"

@implementation ChannelLabel

    //MARK:- 还是不懂
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {

        self.textAlignment = NSTextAlignmentCenter;

        self.font = [UIFont systemFontOfSize:16];

        self.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    }
    
    return self;
}

@end
