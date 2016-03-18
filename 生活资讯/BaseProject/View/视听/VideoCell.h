//
//  VideoCell.h
//  BaseProject
//
//  Created by tarena on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>
@interface VideoCell : UITableViewCell
@property (nonatomic,strong)  UILabel *titleLabel;
@property (nonatomic,strong)  UILabel *descLabel;
@property (strong ,nonatomic)  UIButton *iconBtn;

//接收地址
@property (nonatomic,strong)NSURL *videoURL;
+(AVPlayerViewController *)sharedInstance;
@end
