//
//  model.m
//  列表异步下载网络图片
//
//  Created by 9264 on 16/8/20.
//  Copyright © 2016年 LY9264. All rights reserved.
//

#import "LYmodel.h"

@implementation LYmodel
+ (instancetype)appWithDict:(NSDictionary *)dict
{

    LYmodel *app = [[LYmodel alloc] init];
    
    [app setValuesForKeysWithDictionary:dict];
    
    return app;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{}

@end

