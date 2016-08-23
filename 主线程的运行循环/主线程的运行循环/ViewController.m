//
//  ViewController.m
//  主线程的运行循环
//
//  Created by 9264 on 16/8/23.
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

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self timrDemo];
}

- (void)timrDemo{
    NSTimer *time = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(demo) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:time forMode:NSRunLoopCommonModes];
}

- (void)demo{
    NSLog(@"JN");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
