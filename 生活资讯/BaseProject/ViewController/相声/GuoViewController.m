//
//  GuoViewController.m
//  BaseProject
//
//  Created by tarena on 16/3/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "GuoViewController.h"
#import "GuoViewModel.h"
#import "LeftOneCell.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
@interface GuoViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)GuoViewModel *guoVM;
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)AVPlayerViewController *vc;
@end

@implementation GuoViewController
+(WFMNavigationController *)standardGuoVC{
    static WFMNavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        GuoViewController *vc =[[GuoViewController alloc]init];
        navi =[[WFMNavigationController alloc]initWithRootViewController:vc];
    });
    return navi;
    
}
-(GuoViewModel *)guoVM{
    if (!_guoVM) {
        _guoVM =[GuoViewModel new];
    }
    return _guoVM;
}
-(instancetype)init{
    if (self=[super init]) {
        self.title = @"郭德纲相声";
        
    }
    return self;
}

-(UITableView *)tableView{
    if (!_tableView ) {
        _tableView =[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        [_tableView registerClass:[LeftOneCell class] forCellReuseIdentifier:@"leftCell"];
        _tableView.delegate =self;
        _tableView.dataSource =self;
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _tableView.header =[MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.guoVM refreshDataCompletionHandle:^(NSError *error) {
                [_tableView reloadData];
                [_tableView.header endRefreshing];
            }];
        }];
        
        _tableView.footer =[MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            [self.guoVM getMoreDataCompletionHandle:^(NSError *error) {
                [_tableView reloadData];
                [_tableView.footer endRefreshing];
             
            }];
        }];
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addMenuItemToVC:self];
    [self.tableView.header beginRefreshing];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.guoVM.rowNumber;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LeftOneCell *cell =[tableView dequeueReusableCellWithIdentifier:@"leftCell"];
    [cell.iconIV.imageView setImageWithURL:[self.guoVM imageURLForRow:indexPath.row]];
    cell.titleLb.text =[self.guoVM titleForRow:indexPath.row];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    /** 添加后台播放模式，需要在plist文件中添加background modes*/
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
    [[AVAudioSession sharedInstance] setActive:YES error:nil];
    
    self.vc =[AVPlayerViewController new];
    AVPlayer *player =[AVPlayer playerWithURL:[self.guoVM audioURLForRow:indexPath.row]];
    self.vc.player =player;
    [self presentViewController:self.vc animated:YES completion:nil];
    [self.vc.player play];//自动播放
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
-(void)viewDidDisappear:(BOOL)animated{
    [self.vc.player pause];//暂停
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
