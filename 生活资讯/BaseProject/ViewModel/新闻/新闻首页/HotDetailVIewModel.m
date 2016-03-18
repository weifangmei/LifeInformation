//
//  HotDetailVIewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/20.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HotDetailVIewModel.h"

@implementation HotDetailVIewModel
-(instancetype)initWithID:(NSString *)ID{
    if (self =[super init]) {
        _ID = ID;
    }
    return self;
}

-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
      self.dataTask =[HotDetailNetManger getHotDetailID:self.ID completionHandle:^(HotDetailModel *model, NSError *error) {
//          [self.dataArr addObject:model.detailID];
          self.details = model.detailID;
          completionHandle(error);
      }];
}
-(NewID *)model{
    return self.details.firstObject;
}
-(NSURL *)sourceURL{
    return [NSURL URLWithString:[self model].source_url];
}
-(NSString *)source{
    return [self model].source;
}
-(NSString *)replyCount{
    return [NSString stringWithFormat:@"%ld回帖",[self model].replyCount];
}
-(NSArray *)relativesysForRow:(NSInteger)row{
    return  [self model].relative_sys;
}
/** bodyhtml*/
-(NSString *)bodyHtml{
    NSString *bodyHtml =[NSString stringWithFormat:@"<html><body>%@<body/><html/>",[self model].body];
    return bodyHtml;
}
@end
