//
//  FileDownLoad.m
//  NSURLConnection下载文件
//
//  Created by 9264 on 16/8/29.
//  Copyright © 2016年 LY9264. All rights reserved.
//

#import "FileDownLoad.h"
@interface FileDownLoad ()<NSURLConnectionDataDelegate>
@property (nonatomic,copy) NSString *URLString;

@end
@implementation FileDownLoad{

    NSMutableData *_dataM;

    NSOutputStream * _stream;
    long long _expectedLength;
    long long _currentLength;

    NSString *_filePath;
    NSURLConnection *_connection;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        _dataM = [[NSMutableData alloc]init];
    }
    return self;
}


- (void)downLoadWthURLString:(NSString *)URLString{
    
    NSURL *url = [NSURL URLWithString:URLString];
    
    
    _expectedLength = [self getServerFileSizeWith:url];
    
    // 获取本地文件的总大小
    _currentLength = [self getLocalFileSizeAndCompareWihServerFilsize];
    
    if (_currentLength == -5683) {
        NSLog(@"文件已经正确的下载完成 == %@",_filePath);
        return;
    }
    
    
    
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
    
    
    NSString *savepath = @"/Users/LY/Desktop/jn1.zip";
    
    _stream = [NSOutputStream outputStreamToFileAtPath:savepath append:YES];
    
    [_stream open];

}





- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSLog(@"%tu",data.length);
    [_dataM appendData:data];
    
    [_stream write:data.bytes maxLength:data.length];
    [self saveFileForFileHandle:data];
}






- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"完成");
    [_dataM writeToFile:@"/Users/LY/Desktop/jn1.zip" atomically:YES];
}




- (long long)getServerFileSizeWith:(NSURL *)url{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"HEAD";
    NSURLResponse *response ;
    [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:NULL];
    return response.expectedContentLength;
}



- (long long)getLocalFileSizeAndCompareWihServerFilsize{
    
    long long result = 0;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    
    if ([fileManager fileExistsAtPath:_filePath]) {
        NSDictionary *arttrs = [fileManager attributesOfItemAtPath:_filePath error:NULL];
        long long localFileSize = arttrs.fileSize;
        
        if (localFileSize > _expectedLength) {
            //        [fileManager remocein]
            return 0 ;
        }
        if (localFileSize < _expectedLength) {
        
            result = _expectedLength;
        
        }
        if (localFileSize < _expectedLength) {
        
            return -5683;
        
        }
    }

    return result;
    
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
