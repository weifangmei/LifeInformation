//
//  TabViewController.m
//  BaseProject
//
//  Created by tarena on 16/3/14.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TabViewController.h"
#import "GuoViewController.h"
#import "VideoViewController.h"

#import "DuanZiViewController.h"
#import "UIColor+Category.h"

/** 自定义TabBar 使用自定义的的视图 覆盖之前的tabbar的位置*/
@interface TabViewController ()


@end

@implementation TabViewController

+(TabViewController *)standardTabVC{
    static TabViewController *vc =nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vc =[[TabViewController alloc]init];
    });
    return vc;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    [Factory addMenuItemToVC:self];
    WFMNavigationController *GuoNavi =[GuoViewController standardGuoVC];
    WFMNavigationController *duanziNavi =[DuanZiViewController standardDuanZiNavi];
    WFMNavigationController *videoNavi =[VideoViewController standardVideoNavi];
    self.viewControllers =@[GuoNavi,videoNavi,duanziNavi];
    [self apperance];
    
}
-(void)apperance{
    /** 获取UITabBar的风格*/
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"buttontoolbarBkg_white"]];
    /** 获取UITabBarItem的风格*/
    UITabBarItem *barItem =[UITabBarItem appearance];
    /** 设置item中文字的风格*/
    [barItem setTitlePositionAdjustment:UIOffsetMake(0, -1)];
    /** 普通状态*/
    NSMutableDictionary *normalAttribute =[NSMutableDictionary dictionary];
    normalAttribute[NSForegroundColorAttributeName]=[UIColor colorwith255Red:128 green:128 blue:128 alpha:1];
    normalAttribute[NSFontAttributeName]=[UIFont systemFontOfSize:12];
    [barItem setTitleTextAttributes:normalAttribute forState:UIControlStateNormal];
    
    /** 点击之后的状态*/
    
    NSMutableDictionary *selectedAttributes =[NSMutableDictionary dictionary];
    selectedAttributes[NSFontAttributeName]=[UIFont systemFontOfSize:12];
    selectedAttributes[NSForegroundColorAttributeName]=[UIColor colorwith255Red:194 green:50 blue:50 alpha:1];
    [barItem setTitleTextAttributes:selectedAttributes forState:UIControlStateSelected];
    
    self.tabBarItem = barItem;    
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
