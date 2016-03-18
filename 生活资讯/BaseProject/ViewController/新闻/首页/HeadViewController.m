//
//  HeadViewController.m
//  BaseProject
//
//  Created by tarena on 16/3/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "HeadViewController.h"
#import "HeadListViewController.h"
#import "HeadListViewModel.h"
@interface HeadViewController ()

@end

@implementation HeadViewController
+(WFMNavigationController *)standardHeadLineNavi{
    static WFMNavigationController *navi =nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        HeadViewController *vc =[[HeadViewController alloc]initWithViewControllerClasses:[self viewControllerClasses] andTheirTitles:[self itemNames]];
        vc.keys =[self vcKeys];
        vc.values =[self vcValues];
        navi =[[WFMNavigationController alloc]initWithRootViewController:vc];
    });
    return navi;
}
/** 提供题目数组 */
+ (NSArray *)itemNames{
    return @[@"头条",@"娱乐",@"哒哒趣闻",@"财经",@"体育",@"科技",@"漫画",@"时尚",@"原创"];
}
/** 提供每一个题目对应的控制器，题目类型 必须一致*/
+(NSArray *)viewControllerClasses{
    NSMutableArray *arr =[NSMutableArray array];
    for (id obj in [self itemNames]) {
        [arr addObject:[HeadListViewController class]];
    }
    return [arr copy];
}
/** 提供每个VC对应的values值数组 */
+ (NSArray *)vcValues{
    NSMutableArray *arr = [NSMutableArray new];
    for (int i = 0; i <[self itemNames].count; i++) {
        //数值上，vc的infoType的枚举值 恰好和i值相同
        [arr addObject:@(i)];
    }
    return arr;
}
/** 提供每个VC对应的key值数组 */
+ (NSArray *)vcKeys{
    NSMutableArray *arr = [NSMutableArray new];
    for (id obj in [self itemNames]) {
        [arr addObject:@"infoType"];
    }
    return [arr copy];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [Factory addMenuItemToVC:self];
    self.title = @"新闻";
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
