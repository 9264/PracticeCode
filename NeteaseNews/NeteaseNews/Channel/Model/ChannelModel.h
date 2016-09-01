//
//  ChannelModel.h
//  NeteaseNews
//
//  Created by 9264 on 16/9/1.
//  Copyright © 2016年 LY9264. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChannelModel : NSObject

@property (nonatomic,copy) NSString *tname;

@property (nonatomic,copy) NSString *tid;

+ (NSArray *)channels;
@end
