//
//  HeadListNetManger.h
//  BaseProject
//
//  Created by tarena on 16/3/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "HeadListModel.h"

typedef NS_ENUM(NSUInteger, HeadLineType){
    HeadLineTypeTouTiao,//头条
    HeadLineTypeYuLe,//娱乐
    HeadLineTypeDaDaQuWen,//哒哒趣闻
   HeadLineTypeCaiJing,//财经
    HeadLineTypeTiYu,//体育
    HeadLineTypeKeJi,//科技
    HeadLineTypeManHua,//漫画
    HeadLineTypeShiShang,//时尚
    HeadLineTypeYuanChuang,//原创
};

@interface HeadListNetManger : BaseNetManager
+(id)getType:(HeadLineType)type page:(NSInteger)page kCompletionHandle;

@end
