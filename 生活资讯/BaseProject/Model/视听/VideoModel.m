//
//  VideoModel.m
//  BaseProject
//
//  Created by tarena on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoModel.h"

@implementation VideoModel
+(NSDictionary *)objectClassInArray{
    return @{@"videoList":[VideoVideoListModel class],@"videoSidList":[VideoVideoSidListModel class]};
}
@end
@implementation VideoVideoListModel
+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"videoListDescription":  @"description",
             @"m3u8Url": @"m3u8_url",
             @"m3u8HdUrl":@"m3u8Hd_url",
             @"mp4Url":@"mp4_url",
             @"mp4HdUrl":@"mp4Hd_url"
             };
}

@end
@implementation VideoVideoSidListModel



@end