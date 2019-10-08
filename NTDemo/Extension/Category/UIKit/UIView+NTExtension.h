//
//  UIView+NTExtension.h
//  RumHeadLine
//
//  Created by   on 2019/8/10.
//  Copyright © 2019 Wu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (NTExtension)

@property (nonatomic, assign)CGFloat nt_x;
@property (nonatomic, assign)CGFloat nt_y;
@property (nonatomic, assign)CGFloat nt_centerX;
@property (nonatomic, assign)CGFloat nt_centerY;
@property (nonatomic, assign)CGFloat nt_maxX;
@property (nonatomic, assign)CGFloat nt_maxY;
@property (nonatomic, assign)CGFloat nt_width;
@property (nonatomic, assign)CGFloat nt_height;
@end

NS_ASSUME_NONNULL_END
