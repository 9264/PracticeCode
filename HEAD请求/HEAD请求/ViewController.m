//
//  ViewController.m
//  HEAD请求
//
//  Created by 9264 on 16/8/29.
//  Copyright © 2016年 LY9264. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self HEADDemo];
}


- (void)HEADDemo{

    NSURL *url = [NSURL URLWithString:@"j"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"HEAD";
    NSURLResponse *response ;
   NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:NULL];
    NSLog(@"JN");
}

- (void)HEADDemo1{
    
    NSURL *url = [NSURL URLWithString:@"j"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"HEAD";
    NSURLResponse *response ;
    [NSURLConnection sendAsynchronousRequest:request queue:response completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
    
    }];
    NSLog(@"JN");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
