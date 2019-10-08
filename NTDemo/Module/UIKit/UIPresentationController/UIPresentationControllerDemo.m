//
//  UIPresentationControllerDemo.m
//  NTDemo
//
//  Created by   on 9/26/19.
//  Copyright © 2019  . All rights reserved.
//

#import "UIPresentationControllerDemo.h"

@implementation UIPresentationControllerDemo

//- (CGSize)sizeForChildContentContainer:(id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize
//{
//
//}
/*

 override func size(forChildContentContainer container: UIContentContainer,
                    withParentContainerSize parentSize: CGSize) -> CGSize {
   switch direction {
   case .left, .right:
     return CGSize(width: parentSize.width*(2.0/3.0), height: parentSize.height)
   case .bottom, .top:
     return CGSize(width: parentSize.width, height: parentSize.height*(2.0/3.0))
   }
 }
 
*/
//- (CGRect)frameOfPresentedViewInContainerView
//{
//    self.containerView
//}

- (CGSize)sizeForChildContentContainer:(id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize
{
    return parentSize;
}
@end


@interface NTControllerTransitionAnimator ()

@property (nonatomic, strong)NSMutableDictionary * cacheDict;
@end

@implementation NTControllerTransitionAnimator

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    NSLog(@"%@", [NSString stringWithFormat:@"animationControllerForPresentedController presented:%@,presenting:%@,source:%@",presented,presenting,source]);

    NTControllerAnimatedTransition *obj = [NTControllerAnimatedTransition new];
    NSString *key = [NSString stringWithFormat:@"%p",self];
    self.cacheDict[key] = obj;
    return obj;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    NSLog(@"%@", [NSString stringWithFormat:@"animationControllerForDismissedController:%@",dismissed]);
    NSString *key = [NSString stringWithFormat:@"%p",self];
    NTControllerAnimatedTransition *obj = [self.cacheDict objectForKey:key];

    return obj;
}


#pragma mark -

- (NSMutableDictionary *)cacheDict
{
    if (!_cacheDict)
    {
        _cacheDict = [NSMutableDictionary new];
    }
    return _cacheDict;
}

@end


@implementation NTControllerAnimatedTransition

// This is used for percent driven interactive transitions, as well as for
// container controllers that have companion animations that might need to
// synchronize with the main animation.
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    NSLog(@"transitionDuration:%@",transitionContext);

    return 5.0;
}

/*
 let (tempfromView, tempToView, tempContainerView) = retrieveViews(transitionContext: transitionContext)
 guard let fromView = tempfromView, let toView = tempToView, let containerView = tempContainerView else {
   transitionContext.completeTransition(true)
   return
 }

 containerView.insertSubview(toView, at: 0)

 let snapshots = makeSnapshots(toView: toView, fromView: fromView, containerView: containerView)
 containerView.sendSubviewToBack(fromView)
 animateSnapshotsExplode(snapshots) {
   if transitionContext.transitionWasCancelled {
     containerView.bringSubviewToFront(fromView)
   }

   transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
 }
 */
// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    NSLog(@"animateTransition:%@",transitionContext);
    //
    UIView * fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView * toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView * containerView = transitionContext.containerView;
    if (!fromView || !toView || !containerView)
    {
        [transitionContext completeTransition:YES];
    }
    
    [containerView insertSubview:toView atIndex:0];
    [containerView sendSubviewToBack:fromView];
    //[transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    
}

// This is a convenience and if implemented will be invoked by the system when the transition context's completeTransition: method is invoked.
- (void)animationEnded:(BOOL) transitionCompleted
{
    NSLog(@"animationEnded:%d",transitionCompleted);
}

- (UIView *)transitionBgView
{
    if (!_transitionBgView)
    {
        _transitionBgView = [UIView new];
        _transitionBgView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        _transitionBgView.backgroundColor = [UIColor colorWithWhite:0.11 alpha:0.33];
    }
    return _transitionBgView;
}

@end

