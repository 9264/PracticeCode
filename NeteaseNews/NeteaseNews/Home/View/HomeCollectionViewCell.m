//
//  HomeCollectionViewCell.m
//  NeteaseNews
//
//  Created by 9264 on 16/9/2.
//  Copyright © 2016年 LY9264. All rights reserved.
//

#import "HomeCollectionViewCell.h"
#import "NewsTableViewController.h" 
@implementation HomeCollectionViewCell
{
    NewsTableViewController *_newsVC;
}
//MARK:- 防止每次翻页都创建
- (void)awakeFromNib
{

    UIStoryboard *newsSB = [UIStoryboard storyboardWithName:@"News" bundle:nil];

    _newsVC = [newsSB instantiateInitialViewController];

    _newsVC.tableView.frame = self.contentView.bounds;

    [self.contentView addSubview:_newsVC.tableView];
    
    _newsVC.tableView.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    
}

- (void)setURLString:(NSString *)URLString
{
    _URLString = URLString;
    
    _newsVC.URLString = URLString;
}

@end
