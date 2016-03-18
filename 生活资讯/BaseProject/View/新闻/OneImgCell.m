//
//  OneImgCell.m
//  BaseProject
//
//  Created by tarena on 16/3/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "OneImgCell.h"

@implementation OneImgCell
-(UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb =[UILabel new];
        _titleLb.font =[UIFont boldSystemFontOfSize:15];
        [self.contentView addSubview:_titleLb];
        //题目 左 上 10 右10 距离 图片
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.bottom.mas_equalTo(self.icon.mas_top).mas_equalTo(-10);
        }];
        
    }
    return _titleLb;
    
}
-(UILabel *)descLb{
    if (!_descLb) {
        _descLb =[UILabel new];
        _descLb.font =[UIFont systemFontOfSize:13];
        _descLb.numberOfLines = 0;
        _descLb.textColor =[UIColor lightGrayColor];
        [self.contentView addSubview: _descLb];
        [_descLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.rightMargin.mas_equalTo(self.titleLb);
            make.bottom.mas_equalTo(-10);
        }];
    }
    return _descLb;
}
-(TRImageView *)icon{
    if (!_icon) {
        _icon =[[TRImageView alloc]init];
        [self.contentView addSubview:_icon];
        //图片 左10 上 8 右 10 图片大小
        [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.rightMargin.mas_equalTo(self.titleLb);
            make.bottom.mas_equalTo(self.descLb.mas_top).mas_equalTo(-10);
            
        }];

    }
    return _icon;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
       
       
    }
    return self;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
