//
//  LYTableViewCell.h
//  JSON 数据解析(美团)
//
//  Created by 9264 on 16/8/25.
//  Copyright © 2016年 LY9264. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LYModel;
@interface LYTableViewCell : UITableViewCell
@property(nonatomic,strong) LYModel *model;
@end
