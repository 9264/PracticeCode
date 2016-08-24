//
//  ViewController.m
//  Socket获取网络数据
//
//  Created by 9264 on 16/8/24.
//  Copyright © 2016年 LY9264. All rights reserved.
//

#import "ViewController.h"
#import <sys/socket.h>
#import <netinet/in.h>
#import <arpa/inet.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    int socket1 = socket(AF_INET, SOCK_STREAM, 0);
    if (socket1 > 0) {
        NSLog(@"创建成功");
    }else{
        NSLog(@"失败");
    }
    
    
   int connect = connect(socket1,, sizeof())
    if (connect == 0) {
        NSLog(@"成功");
    }else{
        NSLog(@"失败");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
