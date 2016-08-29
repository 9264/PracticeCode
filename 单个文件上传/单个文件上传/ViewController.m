//
//  ViewController.m
//  单个文件上传
//
//  Created by 9264 on 16/8/27.
//  Copyright © 2016年 LY9264. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    /*
     参数
     */
    NSString *URLString = @"http://localhost/php/upload/upload-m.php";
    NSString *serverName = @"userfile[]";
    NSString *filePath1 = [[NSBundle mainBundle] pathForResource:@"car.jpg" ofType:nil];
    NSString *filePath2 = [[NSBundle mainBundle] pathForResource:@"dog.jpg" ofType:nil];
    NSArray *filePaths = @[filePath1,filePath2];
    NSDictionary *textDict = [NSDictionary dictionaryWithObject:@"<<你在天堂遇见的五个人>>" forKey:@"status"];
    
    [self uploadFilesWithURLString:URLString serverName:serverName filePaths:filePaths textDict:textDict];
}






#pragma mark - 自定义方法
- (void)uploadFilesWithURLString:(NSString *)URLString serverName:(NSString *)serverName filePaths:(NSArray *)filePaths textDict:(NSDictionary *)textDict{
    
    NSURL *url = [NSURL URLWithString:URLString];
    
    NSMutableURLRequest *requestM = [NSMutableURLRequest requestWithURL:url];
    
    requestM.HTTPMethod  =@"POST";
    
    [requestM setValue:@"multipart/form-data; boundary=jn" forHTTPHeaderField:@"Content-Type"];
    
    NSData *fromData = [self getfromDataWithServerName:serverName filePaths:filePaths textDict:textDict];
    
    [[[NSURLSession sharedSession] uploadTaskWithRequest:requestM fromData:fromData completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error == nil && data != nil) {
            NSArray *result = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
            NSLog(@"%@",result);
        }else{
            NSLog(@"%@",error);
        }
        
    }] resume];
    
    
}


- (NSData *)getfromDataWithServerName:(NSString *)serverName filePaths:(NSArray *)filePaths textDict:(NSDictionary *)textDict{
    
    NSMutableData *dataM = [NSMutableData data];
    
    [filePaths enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {

        NSMutableString *stringM = [NSMutableString string];
    
        [stringM appendString:@"--jn\r\n"];
        
        [stringM appendFormat:@"Content-Disposition: form-data; name=%@; filename=%@\r\n",serverName,[obj lastPathComponent]];
        
        [stringM appendString:@"Content-Type: image/jpeg\r\n"];
        
        [stringM appendString:@"\r\n"];
        
        [dataM appendData:[stringM dataUsingEncoding:NSUTF8StringEncoding]];
        
        
        NSData *fileData = [NSData dataWithContentsOfFile:obj];
        [dataM appendData:fileData];
        
        
        [dataM appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    }];
    [textDict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {

        NSMutableString *stringM = [NSMutableString string];
        
        
        [stringM appendString:@"--jn\r\n"];
        
        [stringM appendFormat:@"Content-Disposition: form-data; name=%@\r\n",key];
        
        [stringM appendString:@"\r\n"];
       
        
        [stringM appendFormat:@"%@\r\n",obj];
        
      
        [dataM appendData:[stringM dataUsingEncoding:NSUTF8StringEncoding]];
    }];
    
   [dataM appendData:[@"--jn--" dataUsingEncoding:NSUTF8StringEncoding]];
    
    return dataM.copy;

    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
