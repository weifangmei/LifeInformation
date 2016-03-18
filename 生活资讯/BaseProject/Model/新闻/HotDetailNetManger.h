//
//  HotDetailNetManger.h
//  BaseProject
//
//  Created by tarena on 15/11/20.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "HotDetailModel.h"
@interface HotDetailNetManger : BaseNetManager
+(id)getHotDetailID:(NSString *)ID kCompletionHandle;
@end
