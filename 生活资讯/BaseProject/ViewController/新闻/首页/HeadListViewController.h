//
//  HeadListViewController.h
//  BaseProject
//
//  Created by tarena on 16/3/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeadListNetManger.h"
@interface HeadListViewController : UITableViewController
/** 接收外部参数，决定当前控制器显示哪种类型的信息*/
@property (nonatomic,strong)NSNumber *infoType;

@end
