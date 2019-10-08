//
//  UIView+NTExtension.m
//  RumHeadLine
//
//  Created by   on 2019/8/10.
//  Copyright © 2019 Wu. All rights reserved.
//

#import "UIView+NTExtension.h"

@implementation UIView (NTExtension)

- (void)setNt_x:(CGFloat)nt_x
{
    CGRect rt = self.frame;
    rt.origin.x = nt_x;
    self.frame = rt;
}
- (CGFloat)nt_x
{
    return self.frame.origin.x;
}

- (void)setNt_y:(CGFloat)nt_y
{
    CGRect rt = self.frame;
    rt.origin.y = nt_y;
    self.frame = rt;
}

- (CGFloat)nt_y
{
    return self.frame.origin.y;
}

- (void)setNt_centerX:(CGFloat)nt_centerX
{
    CGPoint center = self.center;
    center.x = nt_centerX;
    
    self.center = center;
}
- (CGFloat)nt_centerX
{
    return self.center.x;
}

- (void)setNt_centerY:(CGFloat)nt_centerY
{
    CGPoint center = self.center;
    center.y = nt_centerY;
    
    self.center = center;
}

- (CGFloat)nt_centerY
{
    return self.center.y;
}

- (void)setNt_maxX:(CGFloat)nt_maxX
{
    CGRect rt = self.frame;
    rt.origin.x = self.nt_maxX - self.nt_width;
    
    self.frame = rt;
}
- (CGFloat)nt_maxX
{
    return CGRectGetMaxX(self.frame);
}

- (void)setNt_maxY:(CGFloat)nt_maxY
{
    CGRect rt = self.frame;
    rt.origin.y = self.nt_maxY - self.nt_height;
    
    self.frame = rt;
}
- (CGFloat)nt_maxY
{
    return CGRectGetMaxY(self.frame);
}

- (void)setNt_width:(CGFloat)nt_width
{
    CGRect rt = self.frame;
    rt.size.width = nt_width;
    self.frame = rt;
}
- (CGFloat)nt_width
{
    return self.frame.size.width;
}

- (void)setNt_height:(CGFloat)nt_height
{
    CGRect rt = self.frame;
    rt.size.height = nt_height;
    self.frame = rt;
}

- (CGFloat)nt_height
{
    return self.frame.size.height;
}


@end
