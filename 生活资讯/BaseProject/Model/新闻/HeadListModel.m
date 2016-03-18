//
//  HeadLineModel.m
//  BaseProject
//
//  Created by tarena on 16/3/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "HeadListModel.h"

@implementation HeadListModel


+ (NSDictionary *)objectClassInArray{
    return @{@"T1348647853363":[HeadlineTArrModel class],
             @"T1348648517839":[HeadlineTArrModel class],
             @"T1348649079062":[HeadlineTArrModel class],
             @"T1348649580692":[HeadlineTArrModel class],
             @"T1444270454635":[HeadlineTArrModel class],
             @"T1348648756099":[HeadlineTArrModel class],
             @"T1348650593803":[HeadlineTArrModel class],
             @"T1370583240249":[HeadlineTArrModel class],
             @"T1444289532601":[HeadlineTArrModel class],
             };
}

@end
@implementation HeadlineTArrModel

+ (NSDictionary *)objectClassInArray{
    return @{@"ads" : [HeadlineAdsModel class], @"imgextra" : [HeadLineImgextraModel class]};
}
+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"templateA":@"template",@"ID":@"id"};
}
@end


@implementation HeadlineAdsModel


@end


@implementation HeadLineImgextraModel


@end

