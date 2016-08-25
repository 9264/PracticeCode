//
//  LYModel.m
//  JSON 数据解析(美团)
//
//  Created by 9264 on 16/8/25.
//  Copyright © 2016年 LY9264. All rights reserved.
//

#import "LYModel.h"

@implementation LYModel
+(instancetype)modelWithDict:(NSDictionary *)dict{
    LYModel *model = [[LYModel alloc]init];
    [model setValuesForKeysWithDictionary:dict];
    return model;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
@end
