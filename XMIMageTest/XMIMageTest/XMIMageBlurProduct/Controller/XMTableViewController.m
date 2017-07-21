//
//  XMImageBLurViewController.m
//  XMIMageTest
//
//  Created by XM on 17/7/17.
//  Copyright © 2017年 XM. All rights reserved.
//


#import "XMTableViewController.h"
#import "XMCell.h"

#define RequestUrl @"https://huayiquan.com.cn/index.php?s=Api/facescore/recommend_list&client=ios_1&version=ios_1&app_type=huayiquan_app&mobile=13213213213&page_index=0"

@interface XMTableViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) UITableView *table;

@property (nonatomic, strong) NSMutableArray *cellFrames;


@end

@implementation XMTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    
    UITableView *table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    table.showsVerticalScrollIndicator = NO;
    table.showsHorizontalScrollIndicator = NO;
    table.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:table];
    self.table = table;
    
    [self requestData];
    
}

- (void)requestData
{
    __weak __typeof(self) weakSelf = self;
    NSURLRequest *quest = [NSURLRequest requestWithURL:[NSURL URLWithString:RequestUrl]];
    [NSURLConnection sendAsynchronousRequest:quest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {

        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        for (NSDictionary *result in dict[@"result"]) {
            
            XMCellModel *model = [[XMCellModel alloc] init];
            model.pic = result[@"pic"];
            model.mobile = result[@"mobile"];
            model.push = result[@"push"];
            model.balance = result[@"balance"];
            model.thumb = result[@"thumb"];
            model.nickname = result[@"nickname"];
            model.content = result[@"content"];
            model.red_count = result[@"red_count"];
            model.red_balance = result[@"red_balance"];
            model.concern_count = result[@"concern_count"];
            model.is_show = result[@"is_show"];
            
            XMCellFrame *frame = [[XMCellFrame alloc] init];
            frame.model = model;
            [weakSelf.cellFrames addObject:frame];
            
        }
        
        [weakSelf.table reloadData];
    }];
}

- (NSMutableArray *)cellFrames
{
    if (_cellFrames == nil) {
        _cellFrames = [NSMutableArray array];
    }
    return _cellFrames;
}

#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cellFrames.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XMCell *cell = [XMCell cellWithTable:tableView];
    cell.cell_frame = [self.cellFrames objectAtIndex:indexPath.row];
    return cell;
}

    
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XMCellFrame *frame = [self.cellFrames objectAtIndex:indexPath.row];
    return frame.cellHeight;
}



@end
