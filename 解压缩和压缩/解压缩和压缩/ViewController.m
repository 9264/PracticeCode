//
//  ViewController.m
//  解压缩和压缩
//
//  Created by 9264 on 16/8/31.
//  Copyright © 2016年 LY9264. All rights reserved.
//

#import "ViewController.h"
#import "SSZipArchive.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)jieYaSuo:(UIButton *)sender {

    NSURL *URL = [NSURL URLWithString:@"http://localhost/sogou.zip"];
    
    [[[NSURLSession sharedSession] downloadTaskWithURL:URL completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {

        if (error == nil) {

            [SSZipArchive unzipFileAtPath:location.path toDestination:@"/Users/LY/Desktop/JN"];
            
        } else {
            NSLog(@"%@",error);
        }
        
    }] resume];
}
- (IBAction)yaSuo:(UIButton *)sender {
        [SSZipArchive createZipFileAtPath:@"/Users/LY/Desktop/ly.zip" withContentsOfDirectory:@"/Users/LY/Desktop/JN"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
