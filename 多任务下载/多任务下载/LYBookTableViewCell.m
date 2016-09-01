//
//  LYBookTableViewCell.m
//  多任务下载
//
//  Created by 9264 on 16/8/30.
//  Copyright © 2016年 LY9264. All rights reserved.
//

#import "LYBookTableViewCell.h"

@interface LYBookTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *naemLabel;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (weak, nonatomic) IBOutlet UILabel *sizeLabel;

@end
@implementation LYBookTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    // 创建和设置下载按钮
    UIButton *downloadbtn = [[UIButton alloc] init];
    [downloadbtn setTitle:@"开始" forState:UIControlStateNormal];
    [downloadbtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [downloadbtn setTitle:@"暂停" forState:UIControlStateSelected];
    [downloadbtn sizeToFit];
    
    // 把按钮赋值给cell最右边的view
    self.accessoryView = downloadbtn;
    
    // 添加按钮的点击事件
    [downloadbtn addTarget:self action:@selector(downloadbtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
}
- (void)downloadbtnClick:(UIButton *)button
{

    self.model.isSelectedBtn = !self.model.isSelectedBtn;
    NSString *title = (self.model.isSelectedBtn == YES) ? @"暂停" : @"开始";
    [button setTitle:title forState:UIControlStateNormal];
    
    if ([self.delegate respondsToSelector:@selector(downloadBtnClick:)]) {
        [self.delegate downloadBtnClick:self];
    }
}



- (void)setModel:(LYBookModel *)model{
    _model = model;
    
    UIButton *downloadBtn = (UIButton *)self.accessoryView;
    NSString *title = (model.isSelectedBtn == YES) ? @"暂停" : @"开始";
    [downloadBtn setTitle:title forState:UIControlStateNormal];
    self.naemLabel.text = model.name;
    self.sizeLabel.text = [NSString stringWithFormat:@"%zd",model.size];
    self.progressView.progress = model.progress;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
