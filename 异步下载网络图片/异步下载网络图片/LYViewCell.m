//
//  LYViewCell.m
//  异步下载网络图片
//
//  Created by 9264 on 16/8/22.
//  Copyright © 2016年 LY9264. All rights reserved.
//

#import "LYViewCell.h"
#import "LYModel.h"
#import "UIImageView+WebCache.h"

@interface LYViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (weak, nonatomic) IBOutlet UILabel *nameL;
@property (weak, nonatomic) IBOutlet UILabel *downloadL;

@end

@implementation LYViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


-(void)setModel:(LYModel *)model{
    _model = model;
    self.nameL.text = model.name;
    self.downloadL.text = model.download;
    [self.imageV sd_setImageWithURL:[NSURL URLWithString:model.icon] placeholderImage:[UIImage imageNamed:@"user_default"]];
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
