//
//  VideoNetManger.h
//  BaseProject
//
//  Created by tarena on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "VideoModel.h"
@interface VideoNetManger : BaseNetManager
//解析网络
+(id)getVideoIndex:(NSInteger)index kCompletionHandle;
@end
