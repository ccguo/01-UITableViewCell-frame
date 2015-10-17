//
//  HomeTableViewCell.h
//  01-UITableViewCell高度计算传统frame
//
//  Created by guochaoyang on 15/9/11.
//  Copyright (c) 2015年 guochaoyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *content;

- (void)fillData:(id)obj;

+ (CGFloat)calulateHeightWithtTitle:(NSString*)title;

@end
