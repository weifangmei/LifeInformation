//
//  HeadViewController.h
//  BaseProject
//
//  Created by tarena on 16/3/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WMPageController.h"
@interface HeadViewController :WMPageController
/** 内容页的首页应该是单例的，每一次进程只能初始化一次*/
+(WFMNavigationController *)standardHeadLineNavi;
@end
