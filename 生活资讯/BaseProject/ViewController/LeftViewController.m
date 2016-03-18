//
//  LeftViewController.m
//  BaseProject
//
//  Created by tarena on 16/3/8.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "LeftViewController.h"
#import "HeadViewController.h"
#import "TabViewController.h"
#import "CalendarViewController.h"

@interface LeftViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)NSArray *itemNames;
@property (nonatomic,strong)UITableView *tableView;
@end

@implementation LeftViewController
-(NSArray *)itemNames{
    return @[@"首页",@"日历",@"轻松一刻"];
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView =[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate =self;
        _tableView.dataSource =self;
        _tableView.tableFooterView = [UIView new];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(kWindowW/2, kWindowH/2));
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(0);
        }];
        /** 去掉分割线*/
        _tableView.separatorStyle =UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.itemNames.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.font =[UIFont boldFlatFontOfSize:20];
    cell.accessoryType =UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text =self.itemNames[indexPath.row];
    cell.backgroundColor =[UIColor clearColor];
    cell.textLabel.textColor = [UIColor blackColor];
    cell.contentView.backgroundColor=[UIColor clearColor];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
            [self.sideMenuViewController setContentViewController:[HeadViewController standardHeadLineNavi]animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
          case 1:
            [self.sideMenuViewController setContentViewController:[CalendarViewController standardCalendarVC] animated:YES];
              [self.sideMenuViewController hideMenuViewController];
            break;
        case 2:
            [self.sideMenuViewController setContentViewController:[TabViewController standardTabVC]animated:YES];
              [self.sideMenuViewController hideMenuViewController];
            break;
        default:
            break;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView reloadData];
    self.tableView.backgroundColor=[UIColor clearColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
