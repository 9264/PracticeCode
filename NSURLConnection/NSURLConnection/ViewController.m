//
//  ViewController.m
//  NSURLConnection
//
//  Created by 9264 on 16/8/23.
//  Copyright © 2016年 LY9264. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self loadData];
}

- (void)loadData {
    NSURL *url = [NSURL URLWithString:@"http://www.budejie.com"];
    //MARK:- 方案一
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //MARK:- 方案二
//    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:0 timeoutInterval:15.0];
    //MARK:- 方案三
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setValue:@"iphone AppleWebKit" forHTTPHeaderField:@"User-Agent"];
    
    
[NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
    
    if (connectionError == nil && data != nil) {
        
        NSString *html = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        
        [self.webView loadHTMLString:html baseURL:url];
        
    }
    
}];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

