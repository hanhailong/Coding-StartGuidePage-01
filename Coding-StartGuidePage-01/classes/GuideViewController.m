//
//  GuideViewController.m
//  Coding-StartGuidePage-01
//
//  Created by HailongHan on 15/7/17.
//  Copyright (c) 2015年 HailongHan. All rights reserved.
//

#import "GuideViewController.h"
#import <SMPageControl.h>

@interface GuideViewController ()

@property (nonatomic,strong) UIButton *registerBtn,*loginBtn;

@end

@implementation GuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self configViews];
}

/**
 *  配置视图view
 */
- (void)configViews{
    [self configRegisterLoginButtonAndPageControl];
}

- (void)configRegisterLoginButtonAndPageControl{
    self.registerBtn = [UIButton new];
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
