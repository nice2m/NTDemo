//
//  NSBundle+debugClassInfo.h
//  JLCClient
//
//  Created by Ganjiuhui on 9/21/19.
//  Copyright © 2019 ganjiuhui. All rights reserved.
//


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSBundle (debugClassInfo)

/**
 获取当前工程下自己创建的所有类

 @return 数组
 */
+ (NSArray <Class> *)jlc_bundleOwnClassesInfo;

/**
 获取当前工程下所有类（含系统类、cocoPods类）
 
 @return 数组
 */
+ (NSArray <NSString *> *)jlc_bundleAllClassesInfo;
@end

NS_ASSUME_NONNULL_END
