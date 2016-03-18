//
//  HeadListViewController.m
//  BaseProject
//
//  Created by tarena on 16/3/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "HeadListViewController.h"
#import "HeadListViewModel.h"
#import "LeftOneCell.h"
#import "OneImgCell.h"
#import "ThreeImgCell.h"
#import "iCarousel.h"
#import "HeadDetailHtmlViewController.h"
#import "HeadDetailViewController.h"
@interface HeadListViewController ()<iCarouselDelegate,iCarouselDataSource>
@property (nonatomic,strong)HeadListViewModel *HeadlistVM;
@property (nonatomic,strong)NSArray *headImgURLs;
@property (nonatomic,strong)NSArray *titleArrs;
@end

@implementation HeadListViewController
/** 添加成员变量，因为不需要懒加载，所以不需要属性*/
{
    iCarousel *_ic;
    UIPageControl *_pageControl;
    UILabel *_titleLb;
    NSTimer *_timer;
}
/** 头部滚动视图 */
-(UIView *)headerView{
    [_timer invalidate];
    //如果当前没有头部视图,返回nil
    if(![self.HeadlistVM isContainsHasADForRow:0]) return nil;
    //头部视图origin无效,宽度无效,肯定是与table同宽
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, kWindowW/750 * 500)];
    //添加底部视图
    UIView *botoomView = [UIView new];
    botoomView.backgroundColor = kRGBColor(240, 240, 240);
    
    [headView addSubview:botoomView];
    
    [botoomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(0);
        make.height.mas_equalTo(25);
    }];
    _titleLb = [UILabel new];
    [botoomView addSubview:_titleLb];
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(0);
    }];
    _titleLb.font =[UIFont systemFontOfSize:16];
    _titleLb.text =self.titleArrs[0];
    /** 小圆球*/
    _pageControl = [UIPageControl new];
    _pageControl.numberOfPages = self.headImgURLs.count;
    [botoomView addSubview:_pageControl];
    [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-15);
        make.centerY.mas_equalTo(0);
        make.width.mas_lessThanOrEqualTo(30);
        make.width.mas_greaterThanOrEqualTo(1);
        make.left.mas_equalTo(_titleLb.mas_right).mas_equalTo(-10);
    }];
   
    //添加滚动栏
    _ic = [iCarousel new];
    [headView addSubview:_ic];
    [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.bottom.mas_equalTo(botoomView.mas_top).mas_equalTo(0);
    }];
    _ic.delegate = self;
    _ic.dataSource = self;
    _ic.pagingEnabled = YES;
    _ic.scrollSpeed = 1;
    //如果只有一张图,则不显示圆点
    _pageControl.hidesForSinglePage = YES;
    //如果只有一张图,则不可以滚动
    _ic.scrollEnabled = self.headImgURLs.count != 1;
    _pageControl.pageIndicatorTintColor = [UIColor blackColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    
    if (self.headImgURLs.count > 1) {
        _timer = [NSTimer bk_scheduledTimerWithTimeInterval:3 block:^(NSTimer *timer) {
            [_ic scrollToItemAtIndex:_ic.currentItemIndex+1 animated:YES];
        } repeats:YES];
    }
    //小圆点 不能与用户交互
    _pageControl.userInteractionEnabled = NO;
    return headView;
}
#pragma mark - iCarousel DataSource
-(NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    
    return self.headImgURLs.count;
}
#pragma  mark - iCarousel Delegate
-(UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    if (!view) {
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWindowW, kWindowW/750 * 500 - 35)];
        UIImageView *imageView = [UIImageView new];
        [view addSubview:imageView];
        imageView.tag = 100;
        imageView.contentMode = 2;
        view.clipsToBounds = YES;
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
     UIImageView *imageView = (UIImageView *)[view viewWithTag:100];
    [imageView setImageWithURL:[NSURL URLWithString:self.headImgURLs[index]]placeholderImage:[UIImage imageNamed:@"lm_groupbuy_empty"]];
   
    return view;
    
}

/** 允许循环滚动 */
-(CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    if (option == iCarouselOptionWrap) {
        return YES;
    }
    return value;
}

/** 监控当前滚到到第几个 */
-(void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel
{
    _titleLb.text =self.titleArrs[carousel.currentItemIndex];
    _pageControl.currentPage = carousel.currentItemIndex;
    NSLog(@"zz%ld",_pageControl.currentPage);
}
-(HeadListViewModel *)HeadlistVM{
    if (!_HeadlistVM) {
        _HeadlistVM =[[HeadListViewModel alloc]initWithType:_infoType.integerValue];
    }
    return _HeadlistVM;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[LeftOneCell class] forCellReuseIdentifier:@"LeftOneCell"];
    [self.tableView registerClass:[ThreeImgCell class] forCellReuseIdentifier:@"ThreeCell"];
    [self.tableView registerClass:[OneImgCell class] forCellReuseIdentifier:@"OneImgCell"];
   
    self.tableView.header =[MJRefreshNormalHeader headerWithRefreshingBlock:^{
       [self.HeadlistVM refreshDataCompletionHandle:^(NSError *error) {
           if (error) {
               [self showErrorMsg:error.localizedDescription];
           }
               [self.tableView reloadData];
           self.headImgURLs =[self.HeadlistVM headIconForRow:0];
           self.titleArrs = [self.HeadlistVM headTitleForRow:0];
               self.tableView.tableHeaderView =[self headerView];
               [_ic reloadData];
           
           [self.tableView.header endRefreshing];
       }];
        
    }];
    //开始刷新
    [self.tableView.header beginRefreshing];
    self.tableView.footer =[MJRefreshAutoFooter footerWithRefreshingBlock:^{
        [self.HeadlistVM getMoreDataCompletionHandle:^(NSError *error) {
            if (error) {
                [self showErrorMsg:error.localizedDescription];
            }else{
                [self.tableView reloadData];
            }
            [self.tableView.footer endRefreshing];
        }];
    }];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    return self.HeadlistVM.rowNumber;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.HeadlistVM isImageType:indexPath.row] == 1) {
        OneImgCell *cell =[tableView dequeueReusableCellWithIdentifier:@"OneImgCell"];
        cell.titleLb.text = [self.HeadlistVM titleForRow:indexPath.row];
        [cell.icon.imageView setImageWithURL:[self.HeadlistVM iconForRow:indexPath.row]];
        cell.descLb.text =[self.HeadlistVM diggestForRow:indexPath.row];
        return cell;
    }
    if ([self.HeadlistVM isContainImgextra:indexPath.row]) {
        ThreeImgCell *cell =[tableView dequeueReusableCellWithIdentifier:@"ThreeCell"];
        cell.titleLb.text =[self.HeadlistVM titleForRow:indexPath.row];
        cell.replyCountLb.text =[self.HeadlistVM replyCountForRow:indexPath.row];
        [cell.iconIV0.imageView setImageWithURL:[self.HeadlistVM iconForRow:indexPath.row]];
        [cell.iconIV1.imageView setImageWithURL:[NSURL URLWithString:[self.HeadlistVM imgextraForRow:indexPath.row][0]]];
        [cell.iconIV2.imageView setImageWithURL:[NSURL URLWithString:[self.HeadlistVM imgextraForRow:indexPath.row][1]]];
        return cell;
    }
    LeftOneCell *cell =[tableView dequeueReusableCellWithIdentifier:@"LeftOneCell"];
    cell.titleLb.text = [self.HeadlistVM titleForRow:indexPath.row];
    [cell.iconIV.imageView setImageWithURL:[self.HeadlistVM iconForRow:indexPath.row]];
    cell.longTitleLb.text =[self.HeadlistVM diggestForRow:indexPath.row];
    cell.commentLb.text =[self.HeadlistVM replyCountForRow:indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.HeadlistVM isContainImgextra:indexPath.row]) {
        return 135;
    }
    if ([self.HeadlistVM isImageType:indexPath.row]== 1) {
        return 180;
    }
    return 100;
}
/** 选中每一个图片 进入 详情页*/
-(void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
//    if ([self.HeadlistVM isSkipTypeForRow:index]) {
//        HeadDetailViewController *detailVC =[[HeadDetailViewController alloc]initWithDetailID:[self.HeadlistVM headURLForRow:0][index]];
//        [self.navigationController pushViewController:detailVC animated:YES];
//        
//    }
}
/** 选中每一行进入详情页*/
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.HeadlistVM isContainsHasADForRow:indexPath.row]== 0) {
        HeadDetailHtmlViewController *htmlVC =[[HeadDetailHtmlViewController alloc]initWithURL:[self.HeadlistVM urlForRow:indexPath.row]];
        [self.navigationController pushViewController:htmlVC animated:YES];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
