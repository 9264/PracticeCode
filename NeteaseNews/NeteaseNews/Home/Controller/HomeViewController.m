//
//  HomeViewController.m
//  NeteaseNews
//
//  Created by 9264 on 16/9/1.
//  Copyright © 2016年 LY9264. All rights reserved.
//

#import "HomeViewController.h"
#import "ChannelModel.h"
#import "ChannelLabel.h"
#import "HomeCollectionViewCell.h"
@interface HomeViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *channelScrollView;
@property (weak, nonatomic) IBOutlet UICollectionView *HomeCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *homeFlowLayout;

@end

@implementation HomeViewController{
     NSArray *_channels;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    

    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self createChannelLabel];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.homeFlowLayout.itemSize = self.HomeCollectionView.bounds.size;
}

- (void)createChannelLabel{

    _channels = [ChannelModel channels];

    CGFloat labelW = 80;
    CGFloat labelH = self.channelScrollView.bounds.size.height;

    for (int i = 0; i < _channels.count; i++) {

        ChannelLabel *label = [[ChannelLabel alloc] init];

        [self.channelScrollView addSubview:label];

        CGFloat labelX = labelW * i;
        label.frame = CGRectMake(labelX, 0, labelW, labelH);

        self.channelScrollView.contentSize = CGSizeMake(labelW * _channels.count, 0);

        ChannelModel *model = _channels[i];
        label.text = model.tname;
    }
    self.channelScrollView.contentSize = CGSizeMake(labelW * _channels.count, 0);

}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _channels.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"jn" forIndexPath:indexPath];
    
//    cell.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    
    
    ChannelModel *model = _channels[indexPath.item];
    NSString *URLString = [NSString stringWithFormat:@"article/list/%@/0-20.html",model.tid];

    cell.URLString = URLString;
    
    
    
    return cell;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
