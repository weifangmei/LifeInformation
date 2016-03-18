//
//  LeftOneCell.h
//  BaseProject
//
//  Created by tarena on 16/3/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftOneCell : UITableViewCell
//* 左侧图片 */
@property(nonatomic,strong)TRImageView *iconIV;
//* 题目标签 */
@property(nonatomic,strong)UILabel *titleLb;
//* 长题目标签 */
@property(nonatomic,strong)UILabel *longTitleLb;
//跟帖
@property (nonatomic,strong)UILabel *commentLb;

@end
