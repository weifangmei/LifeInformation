//
//  HotDetailNetManger.m
//  BaseProject
//
//  Created by tarena on 15/11/20.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HotDetailNetManger.h"

@implementation HotDetailNetManger
+(id)getHotDetailID:(NSString *)ID completionHandle:(void (^)(id, NSError *))completionHandle{
  NSString *path =[NSString stringWithFormat:@"http://c.3g.163.com/nc/article/%@/full.html",ID];
    return [self GET:path parameters:nil completionHandler:^(NSDictionary *responseObj, NSError *error) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:responseObj];
        NSArray *arr = dic.allValues;
        [dic removeAllObjects];
        [dic setObject:arr forKey:@"detailID"];
        completionHandle([HotDetailModel objectWithKeyValues:dic],error);
    }];
}
@end
                     