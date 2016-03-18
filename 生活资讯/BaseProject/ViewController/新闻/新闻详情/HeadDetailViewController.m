//
//  HeadDetailViewController.m
//  BaseProject
//
//  Created by tarena on 16/3/14.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "HeadDetailViewController.h"
#import "HeadDetailViewModel.h"
@interface HeadDetailViewController ()
@property (nonatomic,strong)NSArray *imgArr;
@property (nonatomic,strong)NSArray *imgTitle;

@property (nonatomic,strong)UIScrollView  *imgScrollView;
@property (nonatomic,strong)UIScrollView *titleScrollView;

@property (nonatomic,strong)HeadDetailViewModel *detailVM;

@property (nonatomic,strong)UIImageView *image;
@end

@implementation HeadDetailViewController
-(instancetype)initWithDetailID:(NSString *)detailID{
    if (self =[super init]) {
        _detailID = detailID;
    }
    return self;
}
-(HeadDetailViewModel *)detailVM{
    if (_detailVM == nil) {
        _detailVM =[[HeadDetailViewModel alloc]initWithSkipID:_detailID];
    }
    return _detailVM;
}
-(NSArray *)imgArr{
    if (!_imgArr) {
        _imgArr =[self.detailVM imgurl];
    }
    return _imgArr;
    
}
-(NSArray *)imgTitle{
    if (!_imgTitle) {
        _imgTitle =[self.detailVM imgTitle];
    }
    return _imgTitle;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.detailVM getDataFromNetCompleteHandle:^(NSError *error) {
        self.image =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 12, 12)];
        [self.view addSubview:self.image];
        [self.image setImageWithURL:[self.detailVM photoViewURL]];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
