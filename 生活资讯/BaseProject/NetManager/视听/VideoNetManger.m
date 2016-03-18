//
//  VideoNetManger.m
//  BaseProject
//
//  Created by tarena on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoNetManger.h"

@implementation VideoNetManger
+(id)getVideoIndex:(NSInteger)index completionHandle:(void (^)(id, NSError *))completionHandle{
    NSString *path =[NSString stringWithFormat:@"http://c.m.163.com/nc/video/home/%ld-10.html",(long)index];
    
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([VideoModel objectWithKeyValues:responseObj],error);
    }];
}
@end
