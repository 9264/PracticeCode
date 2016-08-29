//
//  LYModel.m
//  模拟科技头条
//
//  Created by 9264 on 16/8/26.
//  Copyright © 2016年 LY9264. All rights reserved.
//

#import "LYModel.h"

@implementation LYModel
+ (instancetype)newWithDict:(NSDictionary *)dict{
    LYModel *model = [[LYModel alloc]init];
    [model setValuesForKeysWithDictionary:dict];
    return model;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}




@end
