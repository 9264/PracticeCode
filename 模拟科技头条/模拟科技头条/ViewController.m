//
//  ViewController.m
//  模拟科技头条
//
//  Created by 9264 on 16/8/26.
//  Copyright © 2016年 LY9264. All rights reserved.
//

#import "ViewController.h"
#import "LYModel.h"

@interface ViewController()<UITableViewDataSource>

@end

@implementation ViewController{
    NSArray *_list;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self loadData];
}

- (void)loadData {
    
    NSURL *url = [NSURL URLWithString:@"http://news.coolban.com/Api/Index/news_list/app/2/cat/0/limit/20/time/1472031475/type/0?channel=appstore&uuid=1CF3D8F1-1DFA-4F0B-8335-40F209B0E355&net=5&model=iPhone&ver=1.0.5"];
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil && data != nil) {
            
            
            NSArray *dictArr = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:dictArr.count];
            
            [dictArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                
                LYModel *model = [LYModel newWithDict:obj];
                [arrM addObject:model];
            }];
            
            _list = arrM.copy;
            NSLog(@"%@",_list);
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                [self.tableView reloadData];
            }];
        }
    }] resume];
    
    }
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _list.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"jn" forIndexPath:indexPath];
    LYModel *model = _list[indexPath.row];
    cell.textLabel.text = model.title;
    cell.detailTextLabel.text = model.sitename;
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
