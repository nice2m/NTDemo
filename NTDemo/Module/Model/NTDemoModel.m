//
//  NTDemoModel.m
//  NTDemo
//
//  Created by   on 10/8/19.
//  Copyright © 2019  . All rights reserved.
//

#import "NTDemoModel.h"

@implementation NTDemoModel


+ (instancetype)demoName:(NSString *)name actionBlock:(NTDemoActionBlock)actionBlock
{
    NTDemoModel * model = [[NTDemoModel alloc] init];
    model.demoName = name;
    model.actionBlock = actionBlock;
    
    return model;
}
@end
