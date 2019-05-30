//
//  ViewController.m
//  TableviewLayout
//
//  Created by yang.sun on 2019/5/30.
//  Copyright © 2019年 yang.sun. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import <Masonry.h>
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;

@property (nonatomic,strong)NSMutableArray *dataSource;

@end

@implementation ViewController

-(NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = @[@{@"tags":@[@"AAA",@"BBB",@"CCC",@"DDD",@"EEE",@"FFF",@"GGG",@"HHH",@"III",@"JJJ",@"KKK",@"LLL",@"MMM",@"NNN",@"ZZZ"]},@{@"tags":@[@"OOO",@"PPP",@"QQQ"]},@{@"tags":@[@"RRR",@"SSS",@"TTT",@"UUU",@"VVV",@"YYY",@"XXX",@"WWW"]}].mutableCopy;
        
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];

}

#pragma mark

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellid = @"TableViewCollectionIdentifier";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell = [[TableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    
    cell.dataModel = self.dataSource[indexPath.row];
    return cell;
    
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        //高度自适应
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = 50;
    }
    return _tableView;
}
@end
