//
//  HeadViewModel.m
//  BaseProject
//
//  Created by tarena on 16/3/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "HeadListViewModel.h"

@implementation HeadListViewModel
-(instancetype)initWithType:(HeadLineType)type{
    if (self =[super init]) {
        _type = type;
    }
    return self;
}
-(NSInteger)rowNumber{
    return self.dataArr.count;
}
//获取数据类型
-(HeadlineTArrModel *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}
//标题-- 单元格
-(NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].title;
}
//图片
-(NSURL *)iconForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].imgsrc];
}
//跟帖
-(NSString *)replyCountForRow:(NSInteger)row{
    return [NSString stringWithFormat:@"%ld跟帖",[self modelForRow:row].replyCount];
}
//描述
-(NSString *)diggestForRow:(NSInteger)row
{
    return [self modelForRow:row].digest;
}
/** 通过行数 返回此行中对应的图片链接数组 */
- (NSArray *)imgextraForRow:(NSInteger)row{
    NSMutableArray *arr =[NSMutableArray array];
    for (HeadLineImgextraModel  *model in [self modelForRow:row].imgextra) {
        [arr addObject:model.imgsrc];
    }
    return [arr copy];
}
//通过行数获取url值
-(NSURL *)urlForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].url];
}
/** 判断是否是skipType是否是 photoset*/
-(BOOL)isSkipTypeForRow:(NSInteger)row{
    return [[self modelForRow:row].skipType isEqualToString:@"photoset"];
}
/** 判断是否有头部视图*/
-(BOOL)isContainsHasADForRow:(NSInteger)row{
    return [self modelForRow:row].ads.count;
}
-(BOOL)isContainsHasHeadForRow:(NSInteger)row{
    return [self modelForRow:row].hasHead;
}
//头条中 imgType = 1 显示 中间一张图
-(BOOL)isImageType:(NSInteger)row{
    return [self modelForRow:row].imgType;
}
//显示什么cell 3 张图片 == 0 说明没有
-(BOOL)isContainImgextra:(NSInteger)row{
    return [self modelForRow:row].imgextra.count;
}
//  判断是否有 url 进行 html  无值 .json
-(BOOL)isContainsURLForRow:(NSInteger)row{
    return [self modelForRow:row].url;
}

//跳转 json
-(NSString *)skipIDForRow:(NSInteger)row{
    NSString *str = [self modelForRow:row].skipID;
   
    NSString *num1 =[str substringWithRange:NSMakeRange(4, 4)];
    NSString *num2 =[str substringWithRange:NSMakeRange(9, 6)];
    
    str =[NSString stringWithFormat:@"%@/%@",num1,num2];
 
    return str;
}

//头部视图
-(NSArray *)headIconForRow:(NSInteger)row{
    NSMutableArray *arr =[NSMutableArray array];
    for (HeadlineAdsModel *model in [self modelForRow:row].ads) {
        [arr addObject:model.imgsrc];
    }
    return [arr copy];
}
//头部标题
-(NSArray *)headTitleForRow:(NSInteger)row{
    NSMutableArray *arr =[NSMutableArray array];
    for (HeadlineAdsModel *model in [self modelForRow:row].ads) {
        [arr addObject:model.title];
    }
    return [arr copy];
}
//头部 连接地址 截取字符串 substringWithRange: 专门截取字符串的一块肉
//NSMakeRange(4,2)    从第4个字符开始截取，长度为2个字符，（字符串都是从第0个字符开始数的)
-(NSArray *)headURLForRow:(NSInteger)row{
    NSMutableArray *arr =[NSMutableArray array];
    //00AP0001|112707
    for (HeadlineAdsModel *model in [self modelForRow:row].ads) {
        NSString *str =model.url;
        NSString *num1 =[str substringWithRange:NSMakeRange(4, 4)];
        NSString *num2 =[str substringWithRange:NSMakeRange(9, 6)];
        str =[NSString stringWithFormat:@"%@/%@",num1,num2];
        [arr addObject:str ];
    }
      return [arr copy];
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask =[HeadListNetManger getType:_type page:_page completionHandle:^(HeadListModel *model, NSError *error) {
        if (_page == 0) {
            [self.dataArr removeAllObjects];
        }
        switch (_type) {
            case HeadLineTypeTouTiao:
                [self.dataArr addObjectsFromArray:model.T1348647853363];
                break;
            case HeadLineTypeYuLe:
                [self.dataArr addObjectsFromArray:model.T1348648517839];
                break;
            case HeadLineTypeTiYu:
                [self.dataArr addObjectsFromArray:model.T1348649079062];
                break;
            case HeadLineTypeCaiJing:
                [self.dataArr addObjectsFromArray:model.T1348648756099];
                break;
            case HeadLineTypeKeJi:
                [self.dataArr addObjectsFromArray:model.T1348649580692];
                break;
            case HeadLineTypeManHua:
                [self.dataArr addObjectsFromArray:model.T1444270454635];
                break;
            case HeadLineTypeShiShang:
                [self.dataArr addObjectsFromArray:model.T1348650593803];
                break;
            case HeadLineTypeDaDaQuWen:
                [self.dataArr addObjectsFromArray:model.T1444289532601];
                break;
            case HeadLineTypeYuanChuang:
                [self.dataArr addObjectsFromArray:model.T1370583240249];
                break;
            default:
                break;

        }
        completionHandle(error);
    }];
}
-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    _page = 0;
    [self getDataFromNetCompleteHandle:completionHandle];
}
-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    _page += 20;
    [self getDataFromNetCompleteHandle:completionHandle];
}



@end
