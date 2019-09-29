//
//  UIPresentationControllerDemo.h
//  NTDemo
//
//  Created by Ganjiuhui on 9/26/19.
//  Copyright © 2019 Ganjiuhui. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIPresentationControllerDemo : UIPresentationController

@end

@interface NTControllerTransitionAnimator : NSObject<UIViewControllerTransitioningDelegate>

@end

@interface NTControllerAnimatedTransition : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic, strong)UIView *transitionBgView;

@end

NS_ASSUME_NONNULL_END
