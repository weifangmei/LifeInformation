//
//  HotViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HotViewModel.h"

@implementation HotViewModel
-(NSInteger)rowNumber{
    return self.dataArr.count;
}
//-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
//    self.dataTask =[HotNetManger getHotPassort:_passort completionHandle:^(  HotModel * model, NSError *error) {
//        if (_passort == 0) {
//            [self.dataArr removeAllObjects];
//        }
//        [self.dataArr addObjectsFromArray:model.recomment];
//        completionHandle(error);
//    }];
//}
//-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
//    _passort = 0;
//    [self getDataFromNetCompleteHandle:completionHandle];
//    
//}
//-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
//    _passort += 1;
//    [self getDataFromNetCompleteHandle:completionHandle];
//}
//-(HotRecommentModel *)modelForRow:(NSInteger)row{
//    return self.dataArr[row];
//}
//-(NSString *)titleForRow:(NSInteger)row{
//    return [self modelForRow:row].title;
//}
//-(NSString *)digestForRow:(NSInteger)row{
//
//    return [self modelForRow:row].digest;
//}
//-(NSString *)sourceForRow:(NSInteger)row{
//    return [self modelForRow:row].source;
//}
//-(NSURL *)iconURLForRow:(NSInteger)row{
//    return [NSURL URLWithString:[self modelForRow:row].img];
//}
//-(BOOL)SkipTypeForRow:(NSInteger)row{
//    return [[self modelForRow:row].skipType isEqualToString:@"photoset"];
//}
//-(NSString *)recReasonForRow:(NSInteger)row{
//    return [self modelForRow:row].recReason;
//}
//
//-(NSString *)idForRow:(NSInteger)row{
//  
//    return  [self modelForRow:row].ID;
//}

@end
