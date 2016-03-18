//
//  HotNetManger.m
//  BaseProject
//
//  Created by tarena on 16/3/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "HotNetManger.h"

@implementation HotNetManger
+(id)getHotPassort:(NSInteger)passort completionHandle:(void (^)(id, NSError *))completionHandle{

  NSString *path =[NSString stringWithFormat:@"http://c.3g.163.com/recommend/getSubDocPic?passport=%ld&devId=xuk3JvRaa3uboJw0f8fQg8pyKuTlBvoOo3awckZQBimtfU1O6WFyUrnGfOufGTf0&size=20&version=5.5.4&spever=false&net=wifi&lat=kYqSy%2FhhrEIhQFmd7m2kFw%3D%3D&lon=BhU0c6Uy%2F9%2B7AThKZPBphg%3D%3D&ts=1457252593&sign=qE%2B9K2KVsm505R8tL2NE%2BnsTi1rVL7vQKefU9a9Zbvx48ErR02zJ6%2FKXOnxX046I&encryption=1&canal=appstore",passort];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([HotRecommentModel objectWithKeyValues:responseObj],error);
    }];
    
}
@end
