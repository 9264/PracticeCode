//
//  FileDownLoad.m
//  NSURLConnection下载文件
//
//  Created by 9264 on 16/8/29.
//  Copyright © 2016年 LY9264. All rights reserved.
//

#import "FileDownLoad.h"
@interface FileDownLoad ()<NSURLConnectionDataDelegate>
@end
@implementation FileDownLoad{

    NSMutableData *_dataM;

}
- (instancetype)init
{
    self = [super init];
    if (self) {
        _dataM = [[NSData alloc]init];
    }
    return self;
}


- (void)downLoadWthURLString:(NSString *)URLString{
    
    NSURL *url = [NSURL URLWithString:URLString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    
    [[[NSOperationQueue alloc] init] addOperationWithBlock:^{
        
    [NSURLConnection connectionWithRequest:request delegate:self];
        
        [[NSRunLoop currentRunLoop] run];
    }];
    
    
//    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
//        if (connectionError == nil && data != nil) {
//            
//            [data writeToFile:@"/Users/LY/Desktop/jn1.zip" atomically:YES];
//            
//            
//        }else{
//            NSLog(@"%@",connectionError);
//        }
//    }];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    NSLog(@"总大小%tu",response.expectedContentLength);
    
    /*
     少一步
     */

}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSLog(@"%tu",data.length);
    [_dataM appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"完成");
    [_dataM writeToFile:@"/Users/LY/Desktop/jn1.zip" atomically:YES];
}

#pragma mark - NSFileHandle
- (void)saveFileForFileHandle:(NSData *)data{
    
    NSString *savepath = @"/Users/LY/Desktop/jn1.zip";
    
    NSFileHandle *fileHandle = [NSFileHandle fileHandleForWritingAtPath:savepath];
    
    if (fileHandle == nil) {
        [data writeToFile:savepath atomically:YES];
    }else{
        
        
        [fileHandle seekToEndOfFile];
        [fileHandle writeData:data];
        [fileHandle closeFile];
    }
}







@end
