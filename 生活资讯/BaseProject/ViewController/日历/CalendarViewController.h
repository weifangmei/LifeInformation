//
//  CalendarViewController.h
//  BaseProject
//
//  Created by tarena on 16/3/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FSCalendar.h"
@interface CalendarViewController : UIViewController
@property (nonatomic,strong)FSCalendar *calendar;
@property(nonatomic)BOOL showLunar;
+(WFMNavigationController *)standardCalendarVC;
-(void)todayItemClicked:(id)sender;
-(void)lunarItemClicked:(id)sender;
@end
