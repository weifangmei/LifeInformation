//
//  HeadDetailViewModel.h
//  BaseProject
//
//  Created by tarena on 16/3/14.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "JsonDetailNetManger.h"
@interface HeadDetailViewModel : BaseViewModel

@property (nonatomic,strong)NSString *detailID;
-(instancetype)initWithSkipID:(NSString *)detailID;
/** 获取内容 具体描述*/
-(NSString *)desc;
/** 获取评论url*/
-(NSURL *)commentURL;
/** 获取图片的url*/
-(NSURL *)photoViewURL;
/** 获取图片数组*/
-(NSArray *)imgurl;
/** 获取图片标题*/
-(NSArray *)imgTitle;
/** 获取来源note*/
-(NSArray *)noto;
@end
