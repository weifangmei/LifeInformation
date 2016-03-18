//
//  JsonDetailNetManger.m
//  BaseProject
//
//  Created by tarena on 16/3/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "JsonDetailNetManger.h"
@implementation JsonDetailNetManger
+(id)getURLID:(NSString *)url completionHandle:(void (^)(id, NSError *))completionHandle{
 
    NSString *path =[NSString stringWithFormat:@"http://c.m.163.com/photo/api/set/%@.json",url];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([JSONDetailModel objectWithKeyValues:responseObj],error);
    }];
}
@end
