//
//  ViewController.m
//  NSURLSession的HTTPS
//
//  Created by 9264 on 16/8/30.
//  Copyright © 2016年 LY9264. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}








- (void)lodHtml {
    NSURL *url = [NSURL URLWithString:@"https://mail.itcastcn"];
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil && data != nil) {
            
        }else{
            NSLog(@"%@",error);
        }
    }] resume];
    
    
    
    
}

@end
