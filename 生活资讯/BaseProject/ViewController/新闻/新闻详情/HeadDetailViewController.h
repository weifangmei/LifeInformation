//
//  HeadDetailViewController.h
//  BaseProject
//
//  Created by tarena on 16/3/14.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeadDetailViewController : UIViewController
@property (nonatomic,strong)NSString *detailID;
-(instancetype)initWithDetailID:(NSString *)detailID;
@end
