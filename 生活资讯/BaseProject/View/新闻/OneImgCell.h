//
//  OneImgCell.h
//  BaseProject
//
//  Created by tarena on 16/3/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OneImgCell : UITableViewCell
//标题
@property (nonatomic,strong)UILabel *titleLb;
//描述
@property (nonatomic,strong)UILabel *descLb;
//图片
@property (nonatomic,strong)TRImageView *icon;

@end
