//
//  HeadDetailViewModel.m
//  BaseProject
//
//  Created by tarena on 16/3/14.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "HeadDetailViewModel.h"

@implementation HeadDetailViewModel
-(instancetype)initWithSkipID:(NSString *)detailID{
    if (self =[super init]) {
        _detailID = detailID;
    }
    return self;
}
-(JSONDetailModel *)model{
    return self.dataArr.firstObject;
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask =[JsonDetailNetManger getURLID:_detailID completionHandle:^(JSONDetailModel *model, NSError *error) {
        [self.dataArr addObject:model];
        completionHandle(error);
    }];
}
//7NR8/0963VR
/** 获取内容 具体描述*/
-(NSString *)desc{
    return [self model].desc;
}
/** 获取评论url*/
-(NSURL *)commentURL{
    return [NSURL URLWithString:[self model].commenturl];
}
/** 获取图片的url*/
-(NSURL *)photoViewURL{
    return [NSURL URLWithString:[self model].url];
}
/** 获取图片数组*/
-(NSArray *)imgurl{
    NSMutableArray *arr =[NSMutableArray array];
    for (Photos *photo in [self model].photos) {
        [arr addObject:photo.imgurl];
    }
    return [arr copy];
}
/** 获取图片标题*/
-(NSArray *)imgTitle{
    NSMutableArray *arr =[NSMutableArray array];
    for (Photos *photo in [self model].photos) {
        [arr addObject:photo.imgtitle];
    }
    return [arr copy];
}
/** 获取来源note*/
-(NSArray *)noto{
    NSMutableArray *arr =[NSMutableArray array];
    for (Photos *photo in [self model].photos) {
        [arr addObject:photo.note];
    }
    return [arr copy];
}
@end
