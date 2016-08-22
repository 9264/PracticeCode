//
//  LYModel.m
//  异步下载网络图片
//
//  Created by 9264 on 16/8/22.
//  Copyright © 2016年 LY9264. All rights reserved.
//

#import "LYModel.h"

@implementation LYModel
+ (instancetype)appWithDict:(NSDictionary *)dict

{

    LYModel *model = [[LYModel alloc]init];
    
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
    
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}


@end
