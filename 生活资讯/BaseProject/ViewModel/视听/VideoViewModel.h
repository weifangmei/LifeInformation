//
//  VideoViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "VideoNetManger.h"
@interface VideoViewModel : BaseViewModel
//行数
@property(nonatomic,assign)NSInteger rowNumber;
//当前请求的页数
@property(nonatomic,assign)NSInteger index;

//视频网址
-(NSURL *)videoURLForRow:(NSInteger)row;
//标题
-(NSString *)titleForRow:(NSInteger)row;
//描述
-(NSString *)descForRow:(NSInteger)row;
//图片
-(NSURL *)iconURLForRow:(NSInteger)row;


@end
