//
//  ViewController.m
//  01-UITableViewCell高度计算传统frame
//
//  Created by guochaoyang on 15/9/11.
//  Copyright (c) 2015年 guochaoyang. All rights reserved.
//

#import "ViewController.h"
#import "HomeCell.h"
#import "HomeModel.h"

static NSInteger numberOfSectionsInTableViewCount = 0;
static NSInteger numberOfRowsInSectionCount = 0;
static NSInteger cellForRowAtIndexPathCount = 0;
static NSInteger heightForRowAtIndexPathCount = 0;
static NSInteger estimatedHeightForRowAtIndexPathCount = 0;

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,retain)NSMutableArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"首页";
    
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    CGFloat width = [UIScreen mainScreen].bounds.size.width;

    self.tableView.frame = CGRectMake(0, 0, width, height);
   
    
    self.dataArray = [HomeModel dataArray];

    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setTitle:@"Log" forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(log) forControlEvents:UIControlEventTouchUpInside];
    [rightButton setFrame:CGRectMake(0, 0, 40, 30)];
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightBarItem;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    numberOfSectionsInTableViewCount ++;
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    numberOfRowsInSectionCount ++;
    return [self.dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    cellForRowAtIndexPathCount ++;
    static NSString *cellIdentifier = @"cellIdentifier";
    HomeCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    [cell fillData:self.dataArray[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    heightForRowAtIndexPathCount ++;
    return [HomeCell calulateHeightWithtTitle:self.dataArray[indexPath.row]];
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    estimatedHeightForRowAtIndexPathCount ++;
    return 100;
}

#pragma mark - event
- (void)log
{
    NSLog(@"numberOfSectionsInTableViewCount : %ld",numberOfSectionsInTableViewCount);
    NSLog(@"numberOfRowsInSectionCount : %ld",numberOfRowsInSectionCount);
    NSLog(@"cellForRowAtIndexPathCount : %ld",cellForRowAtIndexPathCount);
    NSLog(@"heightForRowAtIndexPathCount : %ld",heightForRowAtIndexPathCount);
    NSLog(@"estimatedHeightForRowAtIndexPathCount : %ld",estimatedHeightForRowAtIndexPathCount);
    
    numberOfSectionsInTableViewCount = 0;
    numberOfRowsInSectionCount = 0;
    cellForRowAtIndexPathCount = 0;
    heightForRowAtIndexPathCount = 0;
    estimatedHeightForRowAtIndexPathCount = 0;
}
@end

