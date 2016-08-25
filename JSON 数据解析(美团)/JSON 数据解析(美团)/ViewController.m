//
//  ViewController.m
//  JSON 数据解析(美团)
//
//  Created by 9264 on 16/8/24.
//  Copyright © 2016年 LY9264. All rights reserved.
//

#import "ViewController.h"
#import "LYModel.h"
#import "LYTableViewCell.h"

@interface ViewController ()<UITableViewDataSource>

@end

@implementation ViewController{
    NSArray<LYModel *> *_modelList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self loadData];
    
}

- (void)loadData {
    NSURL *url = [NSURL URLWithString:@"http://api.meituan.com/group/v2/recommend/homepage/city/1?msid=01244296-D7EA-41D9-B266-DED933DC321E2016-08-24-19-07545&userid=424096796&__vhost=api.mobile.meituan.com&position=40.059204%2C116.335925&movieBundleVersion=100&utm_term=7.2.0&limit=40&wifi-mac=f4%3A5c%3A89%3Ab1%3A30%3Abf&ci=1&__skcy=s1Fhbuv%2FKP6WR9Zo1arlxdSFKG8%3D&__skck=3c0cf64e4b039997339ed8fec4cddf05&__skua=3245c5608cd45ea30d6ecb9389c3af07&wifi-name=5683&client=iphone&uuid=33D393DD3E88C043DF261FC7F5258D1172F11AA8C4F0C4B9B512CBB19FFC22EC&__skts=1472036856.022121&__skno=B9553BA0-FD0C-486B-A33D-182136E594E1&utm_content=33D393DD3E88C043DF261FC7F5258D1172F11AA8C4F0C4B9B512CBB19FFC22EC&utm_source=AppStore&utm_medium=iphone&version_name=7.2.0&wifi-cur=0&wifi-strength=&offset=0&supportId=1&__reqTraceID=2692B464-7F10-40C3-A2DD-58D1DBCF7987&js_patch_version=5&rn_package_version=0&utm_campaign=AgroupBgroupD200GhomepageH0&userId=424096796"];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil && data != nil) {
            
            id result = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            
            NSArray *arr = result[@"data"];
            
            NSMutableArray *arrM = [NSMutableArray array];
            
            [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                
                LYModel *model = [LYModel modelWithDict:obj];
                [arrM addObject:model];
                
            }];
            
            
            
            _modelList = arrM.copy;
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self.tableView reloadData];
            });
            
            
            
            
//            NSLog(@"%@",_modelList[0].title);
        }
        
        
        
        
    }] resume];
    
    
    
    
    
    
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _modelList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"jn" forIndexPath:indexPath];
    cell.model = _modelList[indexPath.row];
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
