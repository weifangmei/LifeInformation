//
//  HeadViewModel.h
//  BaseProject
//
//  Created by tarena on 16/3/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "HeadListNetManger.h"
@interface HeadListViewModel : BaseViewModel
//行数
@property(nonatomic)NSInteger rowNumber;
//类型
@property(nonatomic)HeadLineType type;
//页数
@property(nonatomic)NSInteger page;

-(instancetype)initWithType:(HeadLineType)type;
//标题-- 单元格
-(NSString *)titleForRow:(NSInteger)row;
//图片
-(NSURL *)iconForRow:(NSInteger)row;
//跟帖
-(NSString *)replyCountForRow:(NSInteger)row;
//描述
-(NSString *)diggestForRow:(NSInteger)row;
/** 通过行数 返回此行中对应的图片链接数组 */
- (NSArray *)imgextraForRow:(NSInteger)row;

//跳转 html
-(NSURL *)urlForRow:(NSInteger)row;
//跳转json
-(NSString *)skipIDForRow:(NSInteger)row;

//头部视图
-(NSArray *)headIconForRow:(NSInteger)row;
//头部标题
-(NSArray *)headTitleForRow:(NSInteger)row;
//头部 连接地址 截取字符串 substringWithRange: 专门截取字符串的一块肉
//NSMakeRange(4,2)    从第4个字符开始截取，长度为2个字符，（字符串都是从第0个字符开始数的)
-(NSArray *)headURLForRow:(NSInteger)row;
/** 判断是否是skipType是否是 photoset*/
-(BOOL)isSkipTypeForRow:(NSInteger)row;

/** 判断是否有头部滚动视图*/
-(BOOL)isContainsHasADForRow:(NSInteger)row;
/** 是否含有 头部视图*/
-(BOOL)isContainsHasHeadForRow:(NSInteger)row;
//头条中 imgType = 1 显示 中间一张图
-(BOOL)isImageType:(NSInteger)row;
//显示什么cell 3 张图片
-(BOOL)isContainImgextra:(NSInteger)row;


@end
