//
//  HotDetailModel.h
//  BaseProject
//
//  Created by tarena on 15/11/20.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class NewID,HotDetailSpinfoModel,HotDetailTopiclistModel,HotDetailRelative_SysModel,HotDetailKeyword_SearchModel;
@interface HotDetailModel : BaseModel

//@property (nonatomic, strong) NewID *B8RHHK370001124J;
@property (nonatomic,strong)NSArray<NewID *> *detailID;

@end
@interface NewID : BaseModel

@property (nonatomic, copy) NSString *ptime;

@property (nonatomic, copy) NSString *source;

@property (nonatomic, copy) NSString *tid;

@property (nonatomic, strong) NSArray *link;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray *apps;

@property (nonatomic, strong) NSArray *boboList;

@property (nonatomic, strong) NSArray *img;

@property (nonatomic, strong) NSArray *topiclist_news;

@property (nonatomic, strong) NSArray *ydbaike;

@property (nonatomic, copy) NSString *docid;

@property (nonatomic, assign) BOOL picnews;

@property (nonatomic, assign) NSInteger replyCount;

@property (nonatomic, copy) NSString *source_url;

@property (nonatomic, copy) NSString *templateA;

@property (nonatomic, copy) NSString *replyBoard;

@property (nonatomic, assign) BOOL hasNext;

@property (nonatomic, strong) NSArray<HotDetailTopiclistModel *> *topiclist;

@property (nonatomic, copy) NSString *body;

@property (nonatomic, strong) NSArray<HotDetailKeyword_SearchModel *> *keyword_search;

@property (nonatomic, strong) NSArray *votes;

@property (nonatomic, assign) NSInteger threadAgainst;

@property (nonatomic, copy) NSString *voicecomment;

@property (nonatomic, copy) NSString *dkeys;

@property (nonatomic, strong) NSArray *users;

@property (nonatomic, strong) NSArray<HotDetailSpinfoModel *> *spinfo;

@property (nonatomic, assign) NSInteger threadVote;

@property (nonatomic, strong) NSArray<HotDetailRelative_SysModel *> *relative_sys;

@property (nonatomic, copy) NSString *digest;

@end

@interface HotDetailSpinfoModel : BaseModel

@property (nonatomic, copy) NSString *ref;

@property (nonatomic, copy) NSString *spcontent;

@property (nonatomic, copy) NSString *sptype;

@end

@interface HotDetailTopiclistModel : BaseModel

@property (nonatomic, copy) NSString *subnum;

@property (nonatomic, assign) BOOL hasCover;

@property (nonatomic, copy) NSString *alias;

@property (nonatomic, copy) NSString *tname;

@property (nonatomic, copy) NSString *ename;

@property (nonatomic, copy) NSString *tid;

@property (nonatomic, copy) NSString *cid;

@end

@interface HotDetailRelative_SysModel : NSObject

@property (nonatomic, copy) NSString *source;

@property (nonatomic, copy) NSString *imgsrc;

@property (nonatomic, copy) NSString *ptime;

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *href;

@property (nonatomic, copy) NSString *type;

@end

@interface HotDetailKeyword_SearchModel : NSObject

@property (nonatomic, copy) NSString *word;

@end

