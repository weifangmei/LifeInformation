//
//  ThreeImgCell.h
//  BaseProject
//
//  Created by tarena on 16/3/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThreeImgCell : UITableViewCell
/** 题目标签*/
@property (nonatomic,strong)UILabel *titleLb;
/** 图片1*/
@property (nonatomic,strong)TRImageView *iconIV0;
/** 图片2*/
@property (nonatomic,strong)TRImageView *iconIV1;
/** 图片3*/
@property (nonatomic,strong)TRImageView *iconIV2;
/** 跟帖数标签*/
@property (nonatomic,strong)UILabel *replyCountLb;
@end
