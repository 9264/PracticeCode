//
//  ViewController.m
//  NSURLConnection下载文件
//
//  Created by 9264 on 16/8/29.
//  Copyright © 2016年 LY9264. All rights reserved.
//

#import "ViewController.h"
#import "FileDownLoad.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    FileDownLoad *downLoad = [[FileDownLoad alloc]init];
    
    [downLoad downLoadWthURLString:@"http://localhost/sogou.zip"];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
