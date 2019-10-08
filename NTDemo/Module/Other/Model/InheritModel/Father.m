//
//  Father.m
//  NTDemo
//
//  Created by   on 10/8/19.
//  Copyright © 2019  . All rights reserved.
//

#import "Father.h"
#import <objc/message.h>

@implementation Father
//- (Class)class
//{
//    return [Father class];
//}
@end


//@implementation Son
//
//- (id)init
//{
//    self = [super init];
//    if (self) {
//        NSLog(@"%@", NSStringFromClass([self class]));
//        NSLog(@"%@", NSStringFromClass([super class]));
//    }
//    return self;
//}
//
//@end
@implementation Son
//- (Class)class
//{
//    return [Son class];
//}
- (id)init
{
    self = [super init];
    if (self) {
        
        NSLog(@"%@", NSStringFromClass([self class]));
        NSLog(@"%@", NSStringFromClass([super class]));
    }
    
    return self;
}
@end
