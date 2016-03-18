//
//  VideoCell.m
//  BaseProject
//
//  Created by tarena on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoCell.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>

@implementation VideoCell

//单例的播放器 为了保证同一时间只有一个播放器
+(AVPlayerViewController *)sharedInstance{
    static AVPlayerViewController *vc =nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        vc =[AVPlayerViewController new];
        
    });
    return vc;

}

//如果cell被复用了，需要把cell上的播放器删除掉
-(void)prepareForReuse{
    [super prepareForReuse];
    //判断当前cell是否有播放，如果有，则删除掉，
    [[VideoCell sharedInstance].view removeFromSuperview];
    [VideoCell sharedInstance].player = nil;
}

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel =[[UILabel alloc]init];
        _titleLabel.font=[UIFont systemFontOfSize:18];
        [self.contentView addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
        }];
        
    }
    return _titleLabel;
}
-(UILabel *)descLabel{
    if (!_descLabel) {
        _descLabel=[UILabel new];
        _descLabel.font =[UIFont systemFontOfSize:15];
        _descLabel.textColor=[UIColor lightGrayColor];
        [self.contentView addSubview:_descLabel];
        [_descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.titleLabel.mas_bottom).mas_equalTo(10);
            make.leftMargin.rightMargin.mas_equalTo(self.titleLabel);
        }];
    }
    return _descLabel;
}
-(UIButton *)iconBtn{
    if (!_iconBtn) {
        _iconBtn=[UIButton buttonWithType:0];
        [self.contentView addSubview:_iconBtn];
        [_iconBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.rightMargin.mas_equalTo(self.titleLabel);
            make.top.mas_equalTo(self.descLabel.mas_bottom).mas_equalTo(10);
            make.bottom.mas_equalTo(-10);
            make.size.mas_equalTo(CGSizeMake(kWindowW, kWindowW * 0.5));
        }];
    }
    return _iconBtn;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.iconBtn bk_addEventHandler:^(id sender) {
            AVPlayer *player =[AVPlayer playerWithURL:self.videoURL];
            [player play];
            [VideoCell sharedInstance].player = player;
            [sender addSubview:[VideoCell sharedInstance].view];
            //添加约束
            [[VideoCell sharedInstance].view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.mas_equalTo(0);
            }];

        } forControlEvents:UIControlEventTouchUpInside];
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
