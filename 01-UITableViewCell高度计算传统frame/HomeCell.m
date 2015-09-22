//
//  HomeTableViewCell.m
//  01-UITableViewCell高度计算传统frame
//
//  Created by guochaoyang on 15/9/11.
//  Copyright (c) 2015年 guochaoyang. All rights reserved.
//

#import "HomeCell.h"

@interface HomeCell ()
@property (nonatomic,retain)NSString *title;
@end

@implementation HomeCell

- (void)awakeFromNib {
    // Initialization code
    self.backgroundColor = [UIColor lightGrayColor];
}

- (void)fillData:(id)obj
{
    self.title = obj;
    self.content.text = obj;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    UIFont *font = [self.content font];
    CGSize labelSize = [self.title sizeWithFont:font constrainedToSize:CGSizeMake(width-20, 500)];
    self.content.frame = CGRectMake(10, 10, width-20, labelSize.height);
}

+ (CGFloat)calulateHeightWithtTitle:(NSString*)title
{
    CGFloat height = 20;
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGSize labelSize = [title sizeWithFont:[UIFont systemFontOfSize:17] constrainedToSize:CGSizeMake(width-20, 500)];
    height = height + labelSize.height;
    return height;
}

@end
