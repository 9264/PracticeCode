//
//  LYModel.h
//  JSON 数据解析(美团)
//
//  Created by 9264 on 16/8/25.
//  Copyright © 2016年 LY9264. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYModel : NSObject
@property(nonatomic,copy) NSString *title;
@property(nonatomic,copy) NSString *subTitle;
@property(nonatomic,copy) NSString *mainMessage2;
@property(nonatomic,copy) NSString *subMessage;
@property(nonatomic,copy) NSString *bottomRightInfo;
@property(nonatomic,copy) NSString *imagUrl;


+ (instancetype)modelWithDict:(NSDictionary *)dict;

@end
