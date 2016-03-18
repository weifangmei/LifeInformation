//
//  DetailView.m
//  BaseProject
//
//  Created by tarena on 16/3/14.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "DetailView.h"

@implementation DetailView
-(TRImageView *)imgView{
    if (!_imgView) {
        _imgView =[[TRImageView alloc]init];
        [self addSubview:_imgView];
        [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.center.mas_equalTo(0);
        }];
    }
    return _imgView;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
