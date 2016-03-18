//
//  HotRecommentModel.h
//  BaseProject
//
//  Created by tarena on 16/3/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class recomment;
@interface HotRecommentModel : BaseModel

@property (nonatomic, strong) NSArray<recomment *> *recomment;

@end
@interface recomment : NSObject

@property (nonatomic, assign) NSInteger recType;

@property (nonatomic, copy) NSString *skipType;

@property (nonatomic, assign) NSInteger hasAD;

@property (nonatomic, assign) NSInteger picCount;

@property (nonatomic, copy) NSString *prompt;

@property (nonatomic, copy) NSString *subtitle;

@property (nonatomic, copy) NSString *imgsrc;

@property (nonatomic, assign) NSInteger hasHead;//是否是 头

@property (nonatomic, copy) NSString *img;

@property (nonatomic, copy) NSString *skipID;

@property (nonatomic, copy) NSString *ptime;

@property (nonatomic, copy) NSString *tag;

@property (nonatomic, copy) NSString *docid;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger imgType;

@property (nonatomic, copy) NSString *photosetID;

@property (nonatomic, copy) NSString *program;

@property (nonatomic, assign) NSInteger replyCount;

@property (nonatomic, assign) NSInteger clkNum;
@property (nonatomic, strong) NSString *ID;//根据id值获取详情

@end

