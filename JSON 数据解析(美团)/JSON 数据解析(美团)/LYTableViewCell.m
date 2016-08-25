//
//  LYTableViewCell.m
//  JSON 数据解析(美团)
//
//  Created by 9264 on 16/8/25.
//  Copyright © 2016年 LY9264. All rights reserved.
//

#import "LYTableViewCell.h"
#import "LYModel.h"
#import "UIImageView+WebCache.h"

@interface LYTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *maoSuoLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *marketPrice;
@property (weak, nonatomic) IBOutlet UILabel *yiShouLabel;
@end


@implementation LYTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setModel:(LYModel *)model{
    
    _model = model;
    self.nameLabel.text = model.title;
    self.maoSuoLabel.text = model.subTitle;
    self.priceLabel.text = model.mainMessage2;
    self.marketPrice.text = model.subMessage;
    self.yiShouLabel.text = model.bottomRightInfo;
    [self.imageV sd_setImageWithURL:[NSURL URLWithString:model.imagUrl] placeholderImage:[UIImage imageNamed:@"user_default"]];
    
}






- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
