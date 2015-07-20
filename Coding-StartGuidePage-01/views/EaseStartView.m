//
//  EaseStartView.m
//  Coding-StartGuidePage-01
//
//  Created by HailongHan on 15/7/16.
//  Copyright (c) 2015年 HailongHan. All rights reserved.
//

#import "EaseStartView.h"

@interface EaseStartView ()

@property (nonatomic,strong) UIImageView *bgImageView;
@property (nonatomic,strong) UIImageView *logoImageView;
@property (nonatomic,strong) UILabel *descLabel;

@end

@implementation EaseStartView

+(instancetype)startView{
    return [[self alloc] initWithBgImage:[UIImage imageNamed:@"start_bg_02"] logoImage:[UIImage imageNamed:@"logo_coding_top"] descriptionStr:@"欢迎来到Coding"];
}

-(instancetype)initWithBgImage:(UIImage *)bgImage logoImage:(UIImage *)logoImage descriptionStr:(NSString *)description{
    if (self == [super initWithFrame:kScreen_Bounds]) {
        self.backgroundColor = [UIColor blackColor];
        
        //添加背景
        self.bgImageView = [[UIImageView alloc] initWithFrame:kScreen_Bounds];
        self.bgImageView.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:self.bgImageView];
        
        //添加logo
        self.logoImageView = [UIImageView new];
        self.logoImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:self.logoImageView];
        
        //添加描述
        self.descLabel = [UILabel new];
        self.descLabel.font = [UIFont systemFontOfSize:12];
        self.descLabel.textAlignment = NSTextAlignmentCenter;
        self.descLabel.textColor = [UIColor whiteColor];
        [self addSubview:self.descLabel];
        
        //布局位置
        [self.logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.mas_equalTo(kScreen_Height/7);
            make.width.mas_equalTo(kScreen_Width*2/3);
            make.height.mas_equalTo(kScreen_Width/4*2/3);
        }];
        
        [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.height.mas_equalTo(10);
            make.bottom.mas_equalTo(self.mas_bottom).offset(-15);
            make.left.mas_equalTo(self.mas_left).offset(20);
            make.right.mas_equalTo(self.mas_right).offset(20);
        }];
        
        [self configBgImage:bgImage logoImage:logoImage desc:description];
        
    }
    return self;
}

- (void)configBgImage:(UIImage *)bgImage logoImage:(UIImage *)logoImage desc:(NSString *)desc{
    self.bgImageView.image = bgImage;
    self.logoImageView.image = logoImage;
    self.descLabel.text = desc;
    [self updateConstraintsIfNeeded];
}

- (void)startAnimationWithCompletionBlock:(void (^)(EaseStartView *))completionBlock{
    [kKeyWindow addSubview:self];
    [kKeyWindow bringSubviewToFront:self];
    self.bgImageView.alpha = 0.0;
    self.descLabel.alpha = 0.0;
    
    [UIView animateWithDuration:2.0 animations:^{
        self.bgImageView.alpha = 1.0;
        self.descLabel.alpha = 1.0;
    } completion:^(BOOL finished) {
        //执行移走的动画
        [UIView animateWithDuration:0.6 animations:^{
            //改变frame
            CGRect frame = self.frame;
            frame.origin.x = -kScreen_Width;
            self.frame = frame;
        } completion:^(BOOL finished) {
            //移除
            [self removeFromSuperview];
            if (completionBlock) {
                completionBlock(self);
            }
        }];
    }];
}

@end
