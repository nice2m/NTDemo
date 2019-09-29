//
//  main.m
//  NTDemo
//
//  Created by Ganjiuhui on 9/18/19.
//  Copyright © 2019 Ganjiuhui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <objc/message.h>
#import "NSBundle+debugClassInfo.h"

void bundleTest(void){
    
    NSArray *arr1 = [NSBundle nt_bundleAllClassesInfo];
    
    NSArray *arr2 = [NSBundle nt_bundleOwnClassesInfo];
    
//    //NSLog(@"nt_bundleAllClassesInfo---");
//    [arr1 enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//            //
//        NSLog(@"%@",obj);
//    }];
//    NSLog(@"nt_bundleOwnClassesInfo---");
//    [arr2 enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//            //
//        NSLog(@"%@",obj);
//    }];

    NSString * testClass = @"_LSDefaults";
    
    NSLog([NSString stringWithFormat:@"testClass:%@",testClass]);
    //通过类名获取类的方法列表，打印方法名

        u_int count;
        Method* methods = class_copyMethodList(NSClassFromString(testClass), &count);
        for (int i = 0; i < count; i ++) {
            SEL name = method_getName(methods[i]);
            NSString* strName = [NSString stringWithCString:sel_getName(name) encoding:NSUTF8StringEncoding];
            NSLog(@"method: %@",strName);
        }
    //通过类名获取类属性列表，并打印属性名

        u_int count1;
        objc_property_t* pList = class_copyPropertyList(NSClassFromString(testClass), &count1);
        for (int i = 0; i < count1; i ++) {
            const char* name = property_getName(pList[i]);
            NSString* strName = [NSString stringWithCString:name encoding:NSUTF8StringEncoding];
            NSLog(@"preperty: %@",strName);
        }
    //通过ivar指针获取成员变量列表

        u_int count2;
        Ivar* ivars = class_copyIvarList(NSClassFromString(testClass), &count2);
        for (const Ivar*p = ivars; p < ivars+count2; ++p) {
            Ivar const ivar = *p;
            NSString* name = [NSString stringWithUTF8String:ivar_getName(ivar)];
            NSLog(@"name: %@",name);
        }
    
    
}
int main(int argc, char * argv[]) {
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
