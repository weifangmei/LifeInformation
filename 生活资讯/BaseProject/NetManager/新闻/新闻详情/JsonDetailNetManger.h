//
//  JsonDetailNetManger.h
//  BaseProject
//
//  Created by tarena on 16/3/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "JSONDetailModel.h"
@interface JsonDetailNetManger : BaseNetManager
+(id)getURLID:(NSString *)url kCompletionHandle;
@end
