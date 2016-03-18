//
//  HeadDetailHtmlViewController.h
//  BaseProject
//
//  Created by tarena on 16/3/14.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeadDetailHtmlViewController : UIViewController
@property (nonatomic,strong)NSURL *url;
-(instancetype)initWithURL:(NSURL *)url;
@end
