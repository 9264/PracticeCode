//
//  ViewController.m
//  POST请求模拟登录
//
//  Created by 9264 on 16/8/26.
//  Copyright © 2016年 LY9264. All rights reserved.
//

#define Name @"userName"
#define passW @"passWork"


#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *passWork;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self readUserInfo];
    
    if (_userName.text.length > 0 && _passWork.text.length > 0) {
        [self login:nil];
    }
    
}
- (IBAction)login:(id)sender {
    
    NSString *userName = self.userName.text;
    NSString *password = self.passWork.text;
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/php/login/login.php"];
    
    NSMutableURLRequest *requestM = [NSMutableURLRequest requestWithURL:url];
    requestM.HTTPMethod = @"POST";
    
    NSString *str = [NSString stringWithFormat:@"username=%@&password=%@",userName,password];
    
    requestM.HTTPBody = [str dataUsingEncoding:NSUTF8StringEncoding];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:requestM completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil && data != nil) {
            
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            
            if ([dict[@"userId"] integerValue] == 1) {
                NSLog(@"登录成功");
                [self saveUserInfor];
            }else{
                NSLog(@"登录失败");
            }
        }else
        {
            NSLog(@"%@",error);
        }
    }] resume];
    
    
}

- (void)saveUserInfor{
    [[NSUserDefaults standardUserDefaults] setObject:self.userName.text forKey:Name];
    [[NSUserDefaults standardUserDefaults] setObject:self.passWork.text forKey:passW];
    
}

- (void)readUserInfo{
    
    self.userName.text = [[NSUserDefaults standardUserDefaults] objectForKey:Name];
    self.passWork.text = [[NSUserDefaults standardUserDefaults] objectForKey:passW];
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
