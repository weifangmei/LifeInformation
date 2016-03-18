//
//  VideoViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoViewModel.h"

@implementation VideoViewModel
-(NSInteger)rowNumber{
    return self.dataArr.count;
}
//获取对象
-(VideoVideoListModel *)getVideoListModelForRow:(NSInteger )row{
    return self.dataArr[row];
}
//图片
-(NSURL *)iconURLForRow:(NSInteger)row{
    NSString *path =[self getVideoListModelForRow:row].cover;
    return [NSURL URLWithString:path];
}
//网址
-(NSURL *)videoURLForRow:(NSInteger)row{
    NSString *path =[self getVideoListModelForRow:row].mp4Url;
    return [NSURL URLWithString:path];
    
}
//标题
-(NSString *)titleForRow:(NSInteger)row{
    return [self getVideoListModelForRow:row].title;
}
//描述
-(NSString *)descForRow:(NSInteger)row{
    return [self getVideoListModelForRow:row].videoListDescription;
}

//网络层
//刷新
-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    _index = 0;
    [self getDataFromNetCompleteHandle:completionHandle];
}
//获取更多
-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    _index +=10;
    [self getDataFromNetCompleteHandle:completionHandle];
}
//获取数据
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    //启动线程
    self.dataTask=[VideoNetManger getVideoIndex:_index completionHandle:^(VideoModel *model, NSError *error) {
        if (_index == 0) {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObjectsFromArray:model.videoList];
        completionHandle(error);
        
    }];
    
}
@end
