//
//  HotNetManger.h
//  BaseProject
//
//  Created by tarena on 16/3/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "HotRecommentModel.h"
@interface HotNetManger : BaseNetManager
+(id)getHotPassort:(NSInteger)passort kCompletionHandle;
@end
