//
//  AppDelegate.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"

#import "leftViewController.h"
#import "HeadViewController.h"
@interface AppDelegate ()


@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window =[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController =self.sideMenu;
    [self.window makeKeyAndVisible];
    return YES;
}
-(RESideMenu *)sideMenu{
    if (!_sideMenu) {
        _sideMenu =[[RESideMenu alloc]initWithContentViewController:[HeadViewController standardHeadLineNavi] leftMenuViewController:[LeftViewController new] rightMenuViewController:nil];
        /** 设置背景图*/
        _sideMenu.backgroundImage=[UIImage imageNamed:@"side_background"];
        /** 可以出现菜单栏时 不显示状态栏*/
        _sideMenu.menuPrefersStatusBarHidden  = YES;
        /** 不允许菜单栏可以到了边缘还可以继续*/
        _sideMenu.bouncesHorizontally = NO;
    }
    return _sideMenu;
}
@end
