//
//  UIImageView+JNWebCache.m
//  仿SDWeblmage
//
//  Created by 9264 on 16/8/22.
//  Copyright © 2016年 LY9264. All rights reserved.
//

#import "UIImageView+JNWebCache.h"
#import <objc/runtime.h>
@implementation UIImageView (JNWebCache)

- (void)setLastURLString:(NSString *)lastURLString{
    objc_setAssociatedObject(self, "jn", lastURLString, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)lastURLString
{
    return objc_getAssociatedObject(self, "jn");
}

- (void)JN_setimageWithURLSting:(NSString *)URLSting{
    //从模型中取出图片
    if (![URLSting isEqualToString:self.lastURLString] && self.lastURLString != nil) {
        [[DownladManager sharedManager] cancelWithLastRULStrig:URLSting];
    }
    self.lastURLString = URLSting;
    
    
    //MARK:- 单例
    
    [[DownladManager sharedManager] downloadWithURLString: URLSting finishedBlock:^(UIImage *image) {
        self.image = image;
    }];
}



@end
