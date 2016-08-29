//
//  LYModel.m
//  解析XML文件
//
//  Created by 9264 on 16/8/26.
//  Copyright © 2016年 LY9264. All rights reserved.
//

#import "LYModel.h"

@implementation LYModel
- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ - %@ - %@ - %@ - %@ - %@ - %@",self.videoId,self.name,self.length,self.videoURL,self.imageURL,self.desc,self.teacher];
}
@end
