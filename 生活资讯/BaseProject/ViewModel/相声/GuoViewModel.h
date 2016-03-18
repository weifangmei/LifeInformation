//
//  GuoViewModel.h
//  BaseProject
//
//  Created by jiyingxin on 15/10/26.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "GuoNetManager.h"

@interface GuoViewModel : BaseViewModel

@property(nonatomic) NSInteger rowNumber;

-(NSURL *)audioURLForRow:(NSInteger)row;

- (NSURL *)imageURLForRow:(NSInteger)row;
- (NSString *)titleForRow:(NSInteger)row;

@property(nonatomic) NSInteger pageId;

//最大页数
@property(nonatomic) NSInteger maxPageId;

@end












