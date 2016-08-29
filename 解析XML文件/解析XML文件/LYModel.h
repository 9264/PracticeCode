//
//  LYModel.h
//  解析XML文件
//
//  Created by 9264 on 16/8/26.
//  Copyright © 2016年 LY9264. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYModel : NSObject
@property (copy, nonatomic) NSString *videoId;
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *length;
@property (copy, nonatomic) NSString *videoURL;
@property (copy, nonatomic) NSString *imageURL;
@property (copy, nonatomic) NSString *desc;
@property (copy, nonatomic) NSString *teacher;

@end
