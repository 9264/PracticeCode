//
//  model.h
//  列表异步下载网络图片
//
//  Created by 9264 on 16/8/20.
//  Copyright © 2016年 LY9264. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYmodel : NSObject
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *download;
@property(nonatomic,copy) NSString *icon;

+(instancetype)appWithDict:(NSDictionary *)dict;
@end
