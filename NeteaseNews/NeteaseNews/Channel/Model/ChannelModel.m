//
//  ChannelModel.m
//  NeteaseNews
//
//  Created by 9264 on 16/9/1.
//  Copyright © 2016年 LY9264. All rights reserved.
//

#import "ChannelModel.h"

@implementation ChannelModel
+ (instancetype)channelModelWithDict:(NSDictionary *)dict{
    ChannelModel *model = [[ChannelModel alloc]init];
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}


+(NSArray *)channels{
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"topic_news.json" ofType:nil];
    
    NSData *jsonData= [NSData dataWithContentsOfFile:jsonPath];
    
    NSDictionary *rootDict = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
    
    NSArray *tList = rootDict[@"tList"];
    
    NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:tList.count];
    
    [tList enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        ChannelModel *model = [ChannelModel channelModelWithDict:obj];
        
        [arrM addObject:model];
        
    }];
    
    //排序方法
    [arrM sortUsingComparator:^NSComparisonResult(ChannelModel *obj1, ChannelModel *obj2) {
        
        return [obj1.tid compare:obj2.tid];
    }];
    
    return arrM.copy;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ == %@",self.tid,self.tname];
}

@end
