//
//  LeftOneCell.m
//  BaseProject
//
//  Created by tarena on 16/3/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "LeftOneCell.h"

@implementation LeftOneCell
-(TRImageView *)iconIV{
    if (!_iconIV) {
        _iconIV = [[TRImageView alloc]init];
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(80, 80));
            make.bottom.mas_equalTo(-10);
        }];
    }
    return _iconIV;
}
-(UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb =[[UILabel alloc]init];
        _titleLb.font =[UIFont boldSystemFontOfSize:17];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.topMargin.mas_equalTo(self.iconIV);
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(10);
    
        }];
    }
    return _titleLb;
}
-(UILabel *)longTitleLb{
    if (!_longTitleLb) {
        _longTitleLb =[[UILabel alloc]init];
        _longTitleLb.font =[UIFont systemFontOfSize:14];
        _longTitleLb.textColor =[UIColor lightGrayColor];
        _longTitleLb.numberOfLines = 0;
        [self.contentView addSubview:_longTitleLb];
        [_longTitleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(8);
            make.leftMargin.rightMargin.mas_equalTo(self.titleLb);
            make.bottomMargin.mas_equalTo(self.iconIV);
        }];
    }
    return _longTitleLb;
}
-(UILabel *)commentLb{
    if (!_commentLb) {
        _commentLb=[[UILabel alloc]init];
        _commentLb.font =[UIFont systemFontOfSize:12];
        _commentLb.textColor =[UIColor lightGrayColor];
        _commentLb.textAlignment =NSTextAlignmentRight;
        [self.contentView addSubview:_commentLb];
        [_commentLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottomMargin.mas_equalTo(self.iconIV);
            make.right.mas_equalTo(-8);
            make.width.mas_equalTo(60);
        }];
    }
    return _commentLb;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
