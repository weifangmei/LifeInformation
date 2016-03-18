//
//  HotDetailVIewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/20.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "HotDetailNetManger.h"
@interface HotDetailVIewModel : BaseViewModel
-(instancetype)initWithID:(NSString *)ID;
@property (nonatomic,strong)NSString *ID;
@property (nonatomic,strong)NSArray *details;
/** 详情网址*/
-(NSURL *)sourceURL;
/** body的值*/
-(NSString *)bodyHtml;
/** 回帖的数量*/
-(NSString *)replyCount;
/** 来源网站*/
-(NSString *)source;
/** 有联系的网站*/
-(NSArray *)relativesysForRow:(NSInteger)row;
@property (nonatomic,strong)NSArray *relativesys;

@end
