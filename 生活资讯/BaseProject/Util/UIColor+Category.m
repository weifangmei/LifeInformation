//
//  UIColor+Category.m
//  BaseProject
//
//  Created by tarena on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "UIColor+Category.h"

@implementation UIColor (Category)
+(UIColor *)colorwith255Red:(NSUInteger)red green:(NSUInteger)green blue:(NSUInteger)blue alpha:(NSUInteger)alpha{
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha];
    
}
+(UIColor *)colorWithHex:(long)hex andAlpha:(NSUInteger)alpha{
    float red =((float)((hex & 0xFF0000)>>16))/255.0;
    float green =((float)((hex & 0xFF00)>>8))/255.0;
    float blue =((float)((hex & 0xFF)))/255.0;
    return  [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}
@end
