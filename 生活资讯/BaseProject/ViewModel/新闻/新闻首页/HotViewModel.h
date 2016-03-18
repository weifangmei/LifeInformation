//
//  HotViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "HotNetManger.h"
@interface HotViewModel : BaseViewModel

@property(nonatomic)NSInteger rowNumber;
@property(nonatomic)NSInteger passort;
//标题
-(NSString *)titleForRow:(NSInteger)row;
//图片地址
-(NSURL *)iconURLForRow:(NSInteger)row;
-(NSArray *)imgForRow:(NSInteger)row;
//描述
-(NSString *)digestForRow:(NSInteger)row;
//来源
-(NSString *)sourceForRow:(NSInteger)row;
/** 获取ID值*/
-(NSString *)idForRow:(NSInteger)row;
//获取skipID值
-(NSString *)skipIDForRow:(NSInteger)row;


@end
