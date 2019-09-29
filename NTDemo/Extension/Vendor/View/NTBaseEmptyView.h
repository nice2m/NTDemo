//
//  NTBaseEmptyView.h
//  RumHeadLine
//
//  Created by Ganjiuhui on 2019/8/8.
//  Copyright © 2019 Wu. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

typedef void(^NTBaseEmptyViewActionBlock)(id sender);

@interface NTBaseEmptyView : UIView
@property (nonatomic, strong, readonly) UIView *contentView;

@property (nonatomic, copy)NTBaseEmptyViewActionBlock emptyContainerTapBlock;
@property (nonatomic, copy)NTBaseEmptyViewActionBlock actionBtnBlock;

@end


NS_ASSUME_NONNULL_END
