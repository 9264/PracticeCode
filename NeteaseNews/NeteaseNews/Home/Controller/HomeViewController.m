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
@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *channelScrollView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //MARK:- 这个不懂
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self createChannelLabel];
}

- (void)createChannelLabel{

    NSArray *channelArr = [ChannelModel channels];

    CGFloat labelW = 80;
    CGFloat labelH = self.channelScrollView.bounds.size.height;

    for (int i = 0; i < channelArr.count; i++) {

        ChannelLabel *label = [[ChannelLabel alloc] init];

        [self.channelScrollView addSubview:label];

        CGFloat labelX = labelW * i;
        label.frame = CGRectMake(labelX, 0, labelW, labelH);

        self.channelScrollView.contentSize = CGSizeMake(labelW * channelArr.count, 0);

        ChannelModel *model = channelArr[i];
        label.text = model.tname;
    }


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
