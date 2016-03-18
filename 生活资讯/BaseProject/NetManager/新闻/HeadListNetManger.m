//
//  HeadListNetManger.m
//  BaseProject
//
//  Created by tarena on 16/3/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "HeadListNetManger.h"

@implementation HeadListNetManger
+(id)getType:(HeadLineType)type page:(NSInteger)page completionHandle:(void (^)(id, NSError *))completionHandle{
    NSString *path = nil;
   
    switch (type) {
        case HeadLineTypeKeJi:
            path =[NSString stringWithFormat:@"http://c.m.163.com/nc/article/list/T1348649580692/%@-20.html",@(page)];
            break;
         case HeadLineTypeTiYu:
            path =[NSString stringWithFormat:@"http://c.m.163.com/nc/article/list/T1348649079062/%@-20.html",@(page)];
            break;
        case HeadLineTypeYuLe:
            path =[NSString stringWithFormat:@"http://c.m.163.com/nc/article/list/T1348648517839/%@-20.html",@(page)];
            break;
        case HeadLineTypeManHua:
            path =[NSString stringWithFormat:@"http://c.3g.163.com/nc/article/list/T1444270454635/%@-20.html",@(page)];
            break;
        case HeadLineTypeCaiJing:
           path = [NSString stringWithFormat:@"http://c.m.163.com/nc/article/list/T1348648756099/%@-20.html",@(page)];
            break;
        case HeadLineTypeShiShang:
            path =[NSString stringWithFormat:@"http://c.m.163.com/nc/article/list/T1348650593803/%@-20.html",@(page)];
            break;
        case HeadLineTypeYuanChuang:
            path =[NSString stringWithFormat:@"http://c.m.163.com/nc/article/list/T1370583240249/%@-20.html",@(page)];
            break;
        case HeadLineTypeDaDaQuWen:
            path =[NSString stringWithFormat:@"http://c.m.163.com/nc/article/list/T1444289532601/%@-20.html",@(page)];
            break;
        case HeadLineTypeTouTiao:
            path =[NSString stringWithFormat:@"http://c.m.163.com/nc/article/headline/T1348647853363/%@-20.html",@(page)];
            
            break;
        default:
            break;
    }
      return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([HeadListModel objectWithKeyValues:responseObj],error);
    }];
}
@end
