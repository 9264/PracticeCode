//
//  ViewController.m
//  NSURLSession
//
//  Created by 9264 on 16/8/24.
//  Copyright © 2016年 LY9264. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self loadData];
}



- (void)loadData {
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/demo.json"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error == nil && data != nil) {
           id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSLog(@"%@ -- %@",[json class],json);
        }
        
    }];
    
    [dataTask resume];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
