//
//  HotRecommentModel.m
//  BaseProject
//
//  Created by tarena on 16/3/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "HotRecommentModel.h"

@implementation HotRecommentModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"recomment":@"推荐"};
}
+ (NSDictionary *)objectClassInArray{
    return @{@"推荐" : [recomment class]};
}
@end
@implementation recomment

@end


