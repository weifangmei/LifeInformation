//
//  HeadLineDetailModel.h
//  BaseProject
//
//  Created by tarena on 16/3/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class NewsId,Img;
@interface HeadListDetailModel : BaseModel

//@property (nonatomic, strong) Bhem6R9Q05198Tq2 *BHEM6R9Q05198TQ2;
@property (nonatomic,strong)NSArray<NewsId *> *detailID;
@end
@interface NewsId : NSObject

@property (nonatomic, copy) NSString *ptime;

@property (nonatomic, copy) NSString *source;

@property (nonatomic, copy) NSString *tid;

@property (nonatomic, strong) NSArray *link;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray *apps;

@property (nonatomic, strong) NSArray *boboList;

@property (nonatomic, strong) NSArray<Img *> *img;

@property (nonatomic, strong) NSArray *topiclist_news;

@property (nonatomic, strong) NSArray *ydbaike;

@property (nonatomic, copy) NSString *docid;

@property (nonatomic, assign) BOOL picnews;

@property (nonatomic, assign) NSInteger replyCount;

@property (nonatomic, copy) NSString *templateA;

@property (nonatomic, copy) NSString *replyBoard;

@property (nonatomic, assign) BOOL hasNext;

@property (nonatomic, strong) NSArray *topiclist;

@property (nonatomic, copy) NSString *body;

@property (nonatomic, assign) NSInteger threadAgainst;

@property (nonatomic, strong) NSArray *votes;

@property (nonatomic, copy) NSString *voicecomment;

@property (nonatomic, copy) NSString *dkeys;

@property (nonatomic, strong) NSArray *users;

@property (nonatomic, assign) NSInteger threadVote;

@property (nonatomic, strong) NSArray *relative_sys;

@property (nonatomic, copy) NSString *digest;

@end

@interface Img : NSObject

@property (nonatomic, copy) NSString *pixel;

@property (nonatomic, copy) NSString *alt;

@property (nonatomic, copy) NSString *src;

@property (nonatomic, copy) NSString *ref;

@end

