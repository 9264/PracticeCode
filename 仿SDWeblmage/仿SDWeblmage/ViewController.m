//
//  ViewController.m
//  仿SDWeblmage
//
//  Created by 9264 on 16/8/20.
//  Copyright © 2016年 LY9264. All rights reserved.
//

#import "ViewController.h"
#import "DownloadOperation.h"
#import "LYmodel.h"
#import "AFNetworking.h"
#import "DownladManager.h"
#import "UIImageView+JNWebCache.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@end

@implementation ViewController{

    NSArray *_list;
    


    //
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadJson];

    
    
   
    
}


- (void)loadJson{
    AFHTTPSessionManager *manger = [AFHTTPSessionManager manager];
    
    NSString *url = @"https://raw.githubusercontent.com/9264/practise/master/apps.json";
    
    [manger GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSArray* responseObject) {
        //        NSLog(@"%@ -- %@",[responseObject class],responseObject);
        
        NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:responseObject.count];
        
        [responseObject enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            LYmodel *app = [LYmodel appWithDict:obj ];
            
            [arrM addObject:app];
        }];
        
        
        _list = arrM.copy;
    
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        
    }];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    int random = arc4random_uniform((u_int32_t)_list.count);
    LYmodel *app = _list[random];
    

    //UIimageview 类方法
    
    [self.imageV JN_setimageWithURLSting:app.icon];
    
//    NSString *URLString = @"https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1471695422&di=a440fabd316a37c0ec9cdb0b6f82b604&src=http://cdn.duitang.com/uploads/item/201312/10/20131210173306_8JTLu.jpeg";

                                    
                               
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
