//
//  HotDetailModel.m
//  BaseProject
//
//  Created by tarena on 15/11/20.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HotDetailModel.h"

@implementation HotDetailModel

+(NSDictionary *)objectClassInArray
{
    return @{@"detailID":[NewID class]};
}
@end


@implementation NewID

+ (NSDictionary *)objectClassInArray{
    return @{@"spinfo" : [HotDetailSpinfoModel class], @"topiclist" : [HotDetailTopiclistModel class], @"relative_sys" : [HotDetailRelative_SysModel class], @"keyword_search" : [HotDetailKeyword_SearchModel class]};
}
+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"templateA":@"template"};
}

@end


@implementation HotDetailSpinfoModel

@end


@implementation HotDetailTopiclistModel

@end


@implementation HotDetailRelative_SysModel
+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
}
@end


@implementation HotDetailKeyword_SearchModel

@end


