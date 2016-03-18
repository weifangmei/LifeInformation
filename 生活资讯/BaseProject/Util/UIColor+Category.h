//
//  UIColor+Category.h
//  BaseProject
//
//  Created by tarena on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Category)
+(UIColor *)colorwith255Red:(NSUInteger)red     green:(NSUInteger)green
     blue:(NSUInteger)blue
    alpha:(NSUInteger)alpha ;
+(UIColor *)colorWithHex:(long)hex andAlpha:(NSUInteger)alpha;
@end
