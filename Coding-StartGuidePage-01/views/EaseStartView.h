//
//  EaseStartView.h
//  Coding-StartGuidePage-01
//
//  Created by HailongHan on 15/7/16.
//  Copyright (c) 2015年 HailongHan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EaseStartView : UIView

/**
 *  初始化开始View
 *
 */
+ (instancetype)startView;

- (void)startAnimationWithCompletionBlock:(void (^)(EaseStartView *startView))completionBlock;

@end
