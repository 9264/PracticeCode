//
//  ViewController.m
//  JS交互
//
//  Created by 9264 on 16/9/4.
//  Copyright © 2016年 LY9264. All rights reserved.
//

#import "ViewController.h"
#import "OneViewController.h"
#import "TwoViewController.h"


@interface ViewController () <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.dianping.com/tuan/deal/5501525"]];
    [self.webView loadRequest:request];
    
    self.webView.delegate = self;
}


- (void)webViewDidFinishLoad:(UIWebView *)webView
{

    NSMutableString *stringM = [NSMutableString string];

    [stringM appendString:@"var headerTag = document.getElementsByTagName('header')[0]; headerTag.parentNode.removeChild(headerTag);"];
    
    [stringM appendString:@"var footerTag = document.getElementsByClassName('footer')[0]; footerTag.parentNode.removeChild(footerTag);"];
    
    [stringM appendString:@"var footerBtnTag = document.getElementsByClassName('footer-btn-fix')[0]; footerBtnTag.parentNode.removeChild(footerBtnTag);"];
    
    [stringM appendString:@"var imgTag = document.getElementsByTagName('figure')[0].children[0]; imgTag.onclick=function() {window.location.href='hm://www.yaowoya.com'};"];
    
    [stringM appendString:@"var phoneTag = document.getElementsByClassName('buy-box')[0].children[0]; phoneTag.onclick=function() {window.location.href='jn://www.jiushinile.com'};"];
    
    [webView stringByEvaluatingJavaScriptFromString:stringM];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *URLString = request.URL.absoluteString;
    
    if ([URLString isEqualToString:@"hm://www.yaowoya.com"]) {
        OneViewController *testVC = [[OneViewController alloc] init];
        [self.navigationController pushViewController:testVC animated:YES];
        
        return NO;
    }
    
    if ([URLString isEqualToString:@"jn://www.jiushinile.com"]) {
        TwoViewController *testVC = [[TwoViewController alloc] init];
        [self.navigationController pushViewController:testVC animated:YES];
        
        return NO;
    }
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
