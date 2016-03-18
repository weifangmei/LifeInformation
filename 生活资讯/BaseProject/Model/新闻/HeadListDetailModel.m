//
//  HeadLineDetailModel.m
//  BaseProject
//
//  Created by tarena on 16/3/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "HeadListDetailModel.h"

@implementation HeadListDetailModel
+(NSDictionary *)objectClassInArray{
    return @{@"detailID":[NewsId class]};
}
@end
@implementation NewsId

+ (NSDictionary *)objectClassInArray{
    return @{@"img" : [Img class]};
}
+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"templateA":@"template"};
}
@end


@implementation Img

@end


