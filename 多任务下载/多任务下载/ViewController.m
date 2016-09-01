//
//  ViewController.m
//  多任务下载
//
//  Created by 9264 on 16/8/30.
//  Copyright © 2016年 LY9264. All rights reserved.
//

#import "ViewController.h"
#import "LYBookModel.h"
#import "LYBookTableViewCell.h"
#import "LYDownloadmanager.h"

@interface ViewController ()<UITableViewDataSource,LYBookTableViewCellDelegate>

@end

@implementation ViewController
{
    NSArray *_arrList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self loadBookList];
}

- (void)loadBookList{
    NSURL *url = [NSURL URLWithString:@"http://42.62.15.101/yyting/bookclient/ClientGetBookResource.action?bookId=30776&imei=OEVGRDQ1ODktRUREMi00OTU4LUE3MTctOUFGMjE4Q0JDMTUy&nwt=1&pageNum=1&pageSize=50&q=114&sc=acca7b0f8bcc9603c25a52f572f3d863&sortType=0&token=KMSKLNNITOFYtR4iQHIE2cE95w48yMvrQb63ToXOFc8%2A"];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil && data != nil) {
            NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            
            NSArray *list = result[@"list"];
            
            NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:list.count];
            
            [list  enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                
                LYBookModel *model = [LYBookModel bookWithDict:obj];
                
                [arrM addObject:model];
            }];
            
            _arrList = arrM.copy;
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [self.tableView reloadData];
            }];
         
             NSLog(@"%@",arrM);
            
        }
        else{
            NSLog(@"%@",error);
        }
    }] resume];
    
    
    
}


#pragma mark - UITableVeiw代理方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arrList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    LYBookTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"jn" forIndexPath:indexPath];
    LYBookModel *model = _arrList[indexPath.row];
    cell.model = model;
    cell.delegate = self;
    return cell;
}

- (void)downloadBtnClick:(LYBookTableViewCell *)cell
{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    
    LYBookModel *model = _arrList[indexPath.row];

    [[LYDownloadmanager sharedManager] downloadWithURLString:model.path progressBlock:^(float progress) {
        NSLog(@"进度 VC %zd = %f",indexPath.row,progress);
        
        // 根据cell滚动的角标,重新获取cell
        LYBookTableViewCell *updateCell = [self.tableView cellForRowAtIndexPath:indexPath];

        model.progress = progress;

        updateCell.model = model;
        
    } completionBlock:^(NSString *filePath) {
        
        
    }];
    
    NSLog(@"%s %zd",__func__,indexPath.row);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
