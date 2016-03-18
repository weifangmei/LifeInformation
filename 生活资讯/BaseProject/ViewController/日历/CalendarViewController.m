//
//  CalendarViewController.m
//  BaseProject
//
//  Created by tarena on 16/3/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "CalendarViewController.h"

@interface CalendarViewController ()<FSCalendarDelegate,FSCalendarDataSource,FUIAlertViewDelegate>
@property (nonatomic,strong)NSCalendar *lunarCalendar;
@property (nonatomic,strong)NSArray *lunarChars;
@end

@implementation CalendarViewController
+(WFMNavigationController *)standardCalendarVC{
    static WFMNavigationController *vc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vc =[[WFMNavigationController alloc]initWithRootViewController:[[CalendarViewController alloc]init]] ;
    });
    return vc;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        {
            self.title = @"日历";
            [Factory addMenuItemToVC:self];
            _lunarCalendar =[[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierChinese];
            _lunarCalendar.locale =[NSLocale localeWithLocaleIdentifier:@"zh_CN"];
            _lunarChars =@[@"初一",@"初二",@"初三",@"初四",@"初五",@"初六",@"初七",@"初八",@"初九",@"初十",@"十一",@"十二",@"十三",@"十四",@"十五",@"十六",@"十七",@"十八",@"十九",@"二十",@"二一",@"二二",@"二三",@"二四",@"二五",@"二六",@"二七",@"二八",@"二九",@"三十"];
        }
    }
    return self;
}
-(void)loadView{
    UIView *view =[[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    view.backgroundColor =[UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1.0];
    self.view = view;
    FSCalendar *calendar =[[FSCalendar alloc]initWithFrame:CGRectMake(0, 64, kWindowW, kWindowH - 64)];
    calendar.backgroundColor =[UIColor whiteColor];
    calendar.dataSource =self;
    calendar.delegate = self;
    calendar.pagingEnabled = NO;
    calendar.firstWeekday = 2;
    calendar.appearance.caseOptions = FSCalendarCaseOptionsWeekdayUsesUpperCase | FSCalendarCaseOptionsHeaderUsesUpperCase;
    [self.view addSubview:calendar];
     self.calendar = calendar;
    
    UIBarButtonItem *todayItem =[[UIBarButtonItem alloc]initWithTitle:@"今天 " style:UIBarButtonItemStyleBordered target:self action:@selector(todayItemClicked:)];

    UIBarButtonItem *lunarItem =[[UIBarButtonItem alloc]initWithTitle:@"农历" style:UIBarButtonItemStyleBordered target:self action:@selector(lunarItemClicked:)];

    [lunarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:kRGBColor(80, 50, 122)} forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItems =@[lunarItem,todayItem];
}
-(void)todayItemClicked:(id)sender{
    [self.calendar setCurrentPage:[NSDate date] animated:YES];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"今天的日期" message:[self.calendar stringFromDate:[NSDate date] format:@"yyyy/MM/dd"] delegate:self cancelButtonTitle:@"返回" otherButtonTitles: nil];
    [alert show];
    
}
-(void)lunarItemClicked:(id)sender{
    _showLunar =!_showLunar;
    [_calendar reloadData];
}
-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    _calendar.frame =CGRectMake(0, CGRectGetMaxY(self.navigationController.navigationBar.frame), kWindowW, kWindowH - CGRectGetMaxY(self.navigationController.navigationBar.frame));
}
-(NSString *)calendar:(FSCalendar *)calendar subtitleForDate:(NSDate *)date{
    if (_showLunar) {
        NSInteger day =[_lunarCalendar components:NSCalendarUnitDay fromDate:date].day;
        return _lunarChars[day - 1];
    }
    return nil;
}
//选中每一天 的方法
-(void)calendar:(FSCalendar *)calendar didSelectDate:(NSDate *)date{
//    FUIAlertView *alertView =[[FUIAlertView alloc]initWithTitle:@"您选择的日期是：" message:[calendar stringFromDate:date format:@"yyyy/MM/dd"] delegate:self cancelButtonTitle:@"返回" otherButtonTitles: nil];
//   
//    alertView.messageLabel.font =[UIFont boldFlatFontOfSize:18];
//    
//    [alertView show];
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"您选择的日期" message:[calendar stringFromDate:date format:@"yyyy/MM/dd"] delegate:self cancelButtonTitle:@"返回" otherButtonTitles: nil];
    [alert show];

//    NSLog(@"did select %@",[calendar stringFromDate:date format:@"yyyy/MM/dd"]);
}
/** 显示当前的*/
-(void)calendarCurrentPageDidChange:(FSCalendar *)calendar{
    NSLog(@"did change page %@",[calendar stringFromDate:calendar.currentPage format:@"yyyy-MM"]);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
