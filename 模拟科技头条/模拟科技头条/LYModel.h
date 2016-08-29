//
//  LYModel.h
//  模拟科技头条
//
//  Created by 9264 on 16/8/26.
//  Copyright © 2016年 LY9264. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYModel : NSObject
@property(nonatomic,copy) NSString *id;
@property(nonatomic,copy) NSString *title;
@property(nonatomic,copy) NSString *summary;
@property(nonatomic,copy) NSString *img;
@property(nonatomic,copy) NSString *sitename;
@property(nonatomic,copy) NSString *addtime;
+ (instancetype)newWithDict:(NSDictionary*)dict;
@end
