//
//  ViewController.m
//  仿SDWeblmage
//
//  Created by 9264 on 16/8/20.
//  Copyright © 2016年 LY9264. All rights reserved.
//

#import "ViewController.h"
#import "DownloadOperation.h"

@interface ViewController ()

@end

@implementation ViewController{
    NSOperationQueue *_queue;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
    _queue = [[NSOperationQueue alloc]init];
    NSString *URLString = @"https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1471695422&di=a440fabd316a37c0ec9cdb0b6f82b604&src=http://cdn.duitang.com/uploads/item/201312/10/20131210173306_8JTLu.jpeg";
   DownloadOperation *op = [DownloadOperation downloadWithURLString:URLString finishedBlock:^(UIImage *image) {
        NSLog(@"%@ %@",image,[NSThread currentThread]);

       
    }];
    
    [_queue addOperation:op];
    
    
  
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
