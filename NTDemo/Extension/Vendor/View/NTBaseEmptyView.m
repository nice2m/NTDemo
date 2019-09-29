//
//  NTBaseEmptyView.m
//  RumHeadLine
//
//  Created by Ganjiuhui on 2019/8/8.
//  Copyright © 2019 Wu. All rights reserved.
//

#import "NTBaseEmptyView.h"

@implementation NTBaseEmptyView

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    [super willMoveToSuperview:newSuperview];
    self.frame = newSuperview.bounds;
}

- (instancetype)init
{
    if (self = [super init])
    {
        _contentView = [[UIView alloc] initWithFrame:CGRectZero];
        _contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        UITapGestureRecognizer * tapGS = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(invokeEmptyContainerTapedBlock)];
        self.userInteractionEnabled = YES;
        [self addGestureRecognizer:tapGS];
        [self addSubview:_contentView];
        
    }
    return self;
}

- (void)invokeEmptyContainerTapedBlock
{
    self.emptyContainerTapBlock ? self.emptyContainerTapBlock(self) : nil;
}

@end
