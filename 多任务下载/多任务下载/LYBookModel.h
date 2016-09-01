//
//  LYBookModel.h
//  多任务下载
//
//  Created by 9264 on 16/8/30.
//  Copyright © 2016年 LY9264. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYBookModel : NSObject
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *path;
@property(nonatomic,assign) NSInteger *size;
@property (assign, nonatomic) BOOL isSelectedBtn;
@property (assign, nonatomic) float progress;

+ (instancetype)bookWithDict:(NSDictionary *)dict;
@end
