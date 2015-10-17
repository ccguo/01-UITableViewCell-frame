//
//  HomeModel.m
//  01-UITableViewCell高度计算传统frame
//
//  Created by guochaoyang on 15/9/21.
//  Copyright © 2015年 guochaoyang. All rights reserved.
//

#import "HomeModel.h"

@implementation HomeModel

+ (NSMutableArray *)dataArray
{
    NSMutableArray *dataArray = [NSMutableArray array];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"document.json" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    NSArray *array = [dic objectForKey:@"key1"];
    [dataArray addObjectsFromArray:array];
    return dataArray;
}

+ (id)copyWithZone:(struct _NSZone *)zone
{
    HomeModel *model = [[self alloc] copyWithZone:zone];
    return model;
}


@end
