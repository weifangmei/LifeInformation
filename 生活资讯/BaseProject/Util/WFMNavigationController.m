//
//  WFMNavigationController.m
//  BaseProject
//
//  Created by tarena on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "WFMNavigationController.h"
#import "UIColor+Category.h"
@interface WFMNavigationController ()

@end

@implementation WFMNavigationController
//第一次使用这个类或者这个类的子类的时候调用
+(void)initialize{
    if (self ==[WFMNavigationController class]) {
        //肯定能保存之调用一次
        //获取导航栏条的外观
        UINavigationBar *bar =[UINavigationBar appearance];
        //设置背景色
       [bar setBarTintColor:[UIColor colorwith255Red:193 green:65 blue:65 alpha:1]];
//        [bar setBackgroundImage:[UIImage imageNamed:@"top_navigation_background" ]forBarMetrics:UIBarMetricsDefault];
        //设置左右按钮的文字颜色
        [bar setTintColor:[UIColor whiteColor]];
        //设置返回按钮的箭头样式
        [bar setTitleVerticalPositionAdjustment:0 forBarMetrics:UIBarMetricsDefault];
        //设置标题栏文字的样式
        NSMutableDictionary *attributes =[NSMutableDictionary dictionary];
        attributes[NSForegroundColorAttributeName]=[UIColor blackColor];
        attributes[NSFontAttributeName]=[UIFont italicSystemFontOfSize:20];
        [bar setTitleTextAttributes:attributes];
         
    }
 
}
- (void)viewDidLoad {
    [super viewDidLoad];
   }


@end
