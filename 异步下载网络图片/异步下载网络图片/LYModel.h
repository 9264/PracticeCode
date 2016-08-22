//
//  LYModel.h
//  异步下载网络图片
//
//  Created by 9264 on 16/8/22.
//  Copyright © 2016年 LY9264. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYModel : NSObject
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *download;
@property(nonatomic,copy) NSString *icon;

+ (instancetype)appWithDict:(NSDictionary *)dict;

@end
