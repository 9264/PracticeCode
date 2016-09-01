//
//  LYBookTableViewCell.h
//  多任务下载
//
//  Created by 9264 on 16/8/30.
//  Copyright © 2016年 LY9264. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYBookModel.h"
@class LYBookTableViewCell;
@protocol LYBookTableViewCellDelegate<NSObject>
- (void)downloadBtnClick:(LYBookTableViewCell *)cell;
@end

@interface LYBookTableViewCell : UITableViewCell
@property(nonatomic,strong) LYBookModel *model;
@property (weak, nonatomic) id <LYBookTableViewCellDelegate> delegate;
@end
