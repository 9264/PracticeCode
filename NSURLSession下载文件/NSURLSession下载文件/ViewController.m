//
//  ViewController.m
//  NSURLSession下载文件
//
//  Created by 9264 on 16/8/29.
//  Copyright © 2016年 LY9264. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSURLSessionDownloadDelegate>

@property(nonatomic,strong) NSURLSession *downLoadSession;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (NSURLSession *)downLoadSession{
    if (_downLoadSession == nil) {
        
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        _downLoadSession = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:nil];
    }
    return _downLoadSession;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    NSURL *url = [NSURL URLWithString:@"http://localhost/sogou.zip"];
//    [[[NSURLSession sharedSession] downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        if (error == nil) {
//            
//            [[NSFileManager defaultManager] copyItemAtPath:location toPath:@"/Users/LY/Desktop/jn.zip" error:NULL];
//                    }else{
//            NSLog(@"%@",error);
//        }
//    }] resume];
    
//    NSURLSessionDownloadTask *download = [self.downLoadSession downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        
//    }] ;

    
    /*
     自定义发起的启动任务
     */
    NSURLSessionDownloadTask *downloadTask = [self.downLoadSession downloadTaskWithURL:url];
    
    
    [downloadTask resume];
    
}

#pragma mark - 监听文件下载速度
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite{
    
    float progress = (float)totalBytesWritten / totalBytesExpectedToWrite;
    
    NSLog(@"进度 %f",progress);
    
}


#pragma mark - 监听下载完成
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
didFinishDownloadingToURL:(NSURL *)location
{
    [[NSFileManager defaultManager] copyItemAtPath:location.path toPath:@"/Users/LY/Desktop/jn.zip" error:NULL];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
