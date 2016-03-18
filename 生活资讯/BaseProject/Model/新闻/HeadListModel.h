//
//  HeadLineModel.h
//  BaseProject
//
//  Created by tarena on 16/3/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class HeadlineTArrModel,HeadlineAdsModel,HeadLineImgextraModel;
@interface HeadListModel : BaseModel
//头条
@property (nonatomic, strong) NSArray<HeadlineTArrModel *> *T1348647853363;
//娱乐
@property (nonatomic, strong) NSArray<HeadlineTArrModel *> *T1348648517839;
//体育
@property (nonatomic, strong) NSArray<HeadlineTArrModel *> *T1348649079062;
//科技
@property (nonatomic, strong) NSArray<HeadlineTArrModel *> *T1348649580692;
//漫画
@property (nonatomic, strong) NSArray<HeadlineTArrModel *> *T1444270454635;
//财经
@property (nonatomic, strong) NSArray<HeadlineTArrModel *> *T1348648756099;
//原创
@property (nonatomic, strong) NSArray<HeadlineTArrModel *> *T1370583240249;
//哒哒趣闻
@property (nonatomic, strong) NSArray<HeadlineTArrModel *> *T1444289532601;
//时尚
@property (nonatomic, strong) NSArray<HeadlineTArrModel *> *T1348650593803;
@end

@interface HeadlineTArrModel : NSObject

@property (nonatomic, copy) NSString *tname;

@property (nonatomic, copy) NSString *ptime;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray<HeadLineImgextraModel *> *imgextra;

@property (nonatomic, copy) NSString *photosetID;

@property (nonatomic, assign) NSInteger hasHead;

@property (nonatomic, assign) NSInteger hasImg;

@property (nonatomic, copy) NSString *lmodify;

@property (nonatomic, copy) NSString *templateA;

@property (nonatomic, copy) NSString *skipType;//是否是 photoset 如果是 则显示 三张图 special 显示 左边图 live 显示 一张大图

@property (nonatomic, assign) NSInteger replyCount;

@property (nonatomic, copy) NSString *alias;

@property (nonatomic, copy) NSString *docid;

@property (nonatomic, assign) BOOL hasCover;

@property (nonatomic, assign) NSInteger hasAD;

@property (nonatomic, assign) NSInteger priority;

@property (nonatomic, copy) NSString *cid;

@property (nonatomic, copy) NSString *imgsrc;//图片

@property (nonatomic, assign) BOOL hasIcon;

@property (nonatomic, strong) NSArray<HeadlineAdsModel *> *ads;

@property (nonatomic, copy) NSString *ename;

@property (nonatomic, copy) NSString *skipID;

@property (nonatomic, assign) NSInteger order;

@property (nonatomic, copy) NSString *digest;

@property (nonatomic,strong)NSString *url;//详情

@property (nonatomic,strong)NSString *url_3w;//详情

@property (nonatomic,strong)NSNumber *votecount;

@property (nonatomic,assign)NSInteger imgType;//只有头条里面有

@property (nonatomic,strong)NSString *ID;//id 值
@end

@interface HeadlineAdsModel : NSObject

@property (nonatomic, copy) NSString *url;//JSON 的连接地址

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *subtitle;

@property (nonatomic, copy) NSString *tag;

@property (nonatomic, copy) NSString *imgsrc;



@end

@interface HeadLineImgextraModel : NSObject

@property (nonatomic, copy) NSString *imgsrc;

@end
