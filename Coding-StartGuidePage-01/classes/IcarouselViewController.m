//
//  IcarouselViewController.m
//  Coding-StartGuidePage-01
//
//  Created by HailongHan on 15/7/20.
//  Copyright (c) 2015年 HailongHan. All rights reserved.
//

#import "IcarouselViewController.h"
#import <iCarousel.h>

@interface IcarouselViewController ()<iCarouselDelegate,iCarouselDataSource>

@property (nonatomic,strong) iCarousel *myCarousel;

@end

@implementation IcarouselViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupViews];
}

/**
 *  初始化视图
 */
- (void)setupViews{
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.myCarousel =({
        iCarousel *icarousel = [[iCarousel alloc] init];
        icarousel.dataSource = self;
        icarousel.delegate = self;
        
        icarousel.type = iCarouselTypeLinear;
        icarousel.scrollSpeed = 1.0;
        icarousel.pagingEnabled = YES;
        
        icarousel.decelerationRate = 1.0;
        icarousel.clipsToBounds = YES;
        icarousel.bounceDistance = 0.0001;
        
        [self.view addSubview:icarousel];
        
        [icarousel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(100, 0, 0, 0));
        }];
        
        icarousel;
    });
}

#pragma mark - ICarousel 协议
-(NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return 5;
}

-(UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    
    view.backgroundColor = [UIColor redColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 20)];
    label.textAlignment = NSTextAlignmentCenter;
    
    label.text = [NSString stringWithFormat:@"页码%ld",(long)index];
    
    return label;
}

@end
