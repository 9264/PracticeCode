//
//  ViewController.m
//  发送JSON 数据到服务器
//
//  Created by 9264 on 16/8/28.
//  Copyright © 2016年 LY9264. All rights reserved.
//

#import "ViewController.h"
#import "person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self jsonDemo];
}


- (void)jsonDemo
{
    person *p = [[person alloc]init];
    p.name = @"JN";
    
    [p setValue:@"18" forKey:@"_age"];

    NSDictionary *dict = [p dictionaryWithValuesForKeys:@[@"name",@"_age"]];
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:0 error:NULL];
    
    [self postJSONToServer:jsonData];
    
}


- (void)postJSONToServer:(NSData *)jsonData
{
    NSURL *URL = [NSURL URLWithString:@"http://localhost/php/upload/postjson.php"];
    NSMutableURLRequest *requestM = [NSMutableURLRequest requestWithURL:URL];
    requestM.HTTPMethod = @"POST";

    requestM.HTTPBody = jsonData;
    

    [[[NSURLSession sharedSession] dataTaskWithRequest:requestM completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil && data != nil) {
            
            NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"%@",result);
            
        } else {
            NSLog(@"%@",error);
        }
        
    }] resume];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
