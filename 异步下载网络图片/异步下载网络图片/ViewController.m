//
//  ViewController.m
//  异步下载网络图片
//
//  Created by 9264 on 16/8/22.
//  Copyright © 2016年 LY9264. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "LYModel.h"
#import "LYViewCell.h"

@interface ViewController ()<UITableViewDataSource>

@end

@implementation ViewController{
    NSArray *_appList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _appList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LYViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"jn" forIndexPath:indexPath];
//    cell.model = _appList[indexPath.row];
    LYModel *model = _appList[indexPath.row];
    cell.model = model;
    return cell;
}



- (void)loadData {
    /*
     创建网络请求者
     */
    
    
    AFHTTPSessionManager *mamager = [AFHTTPSessionManager manager];
    
    NSString * URLString = @"https://raw.githubusercontent.com/9264/practise/master/apps.json";
    [mamager GET:URLString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSMutableArray *arrM = [[NSMutableArray alloc]init];
        
        [responseObject enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            LYModel *model = [LYModel appWithDict:obj];
            [arrM addObject:model];
            
        }];
        _appList = arrM.copy;
        
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}


@end
