//
//  NTDemoModel.h
//  NTDemo
//
//  Created by   on 10/8/19.
//  Copyright © 2019  . All rights reserved.
//

#import <Foundation/Foundation.h>



NS_ASSUME_NONNULL_BEGIN

typedef id _Nullable (^NTDemoActionBlock)(_Nullable id parameter);

@interface NTDemoModel : NSObject

@property (nonatomic, copy)NSString * demoName;
@property (nonatomic, copy)NTDemoActionBlock actionBlock;

+ (instancetype)demoName:(NSString *)name actionBlock:(NTDemoActionBlock)actionBlock;

@end

NS_ASSUME_NONNULL_END
