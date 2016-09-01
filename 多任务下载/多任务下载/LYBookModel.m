//
//  LYBookModel.m
//  多任务下载
//
//  Created by 9264 on 16/8/30.
//  Copyright © 2016年 LY9264. All rights reserved.
//

#import "LYBookModel.h"

@implementation LYBookModel
+ (instancetype)bookWithDict:(NSDictionary *)dict{
    LYBookModel *model = [[LYBookModel alloc]init];
    
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
    
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ -- %@ --%zd",self.name,self.path,self.size];
}

@end
