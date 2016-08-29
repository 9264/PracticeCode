//
//  FileDownLoad.m
//  NSURLConnection下载文件
//
//  Created by 9264 on 16/8/29.
//  Copyright © 2016年 LY9264. All rights reserved.
//

#import "FileDownLoad.h"

@implementation FileDownLoad
- (void)downLoadWthURLString:(NSString *)URLString{
    NSURL *url = [NSURL URLWithString:URLString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if (connectionError == nil && data != nil) {
            
            [data writeToFile:@"/Users/LY/Desktop/jn1.zip" atomically:YES];
            
            
        }else{
            NSLog(@"%@",connectionError);
        }
    }];
}
@end
