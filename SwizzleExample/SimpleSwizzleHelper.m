//
//  SimpleSwizzleHelper.m
//  SwizzleExample
//
//  Created by David Fekke on 9/29/21.
//

#import "SimpleSwizzleHelper.h"
#import <objc/runtime.h>

@implementation SimpleSwizzleHelper


+ (void)swizzleMethod:(SEL)originalSelector with:(SEL)swizzledSelector forClass:(Class)clazz isInstanceMethod:(BOOL)isInstanceMethod {
    Method originalMethod;
    Method swizzledMethod;
    
    const char *className = [NSStringFromClass(clazz.self) UTF8String];
    Class myClazz = objc_getMetaClass(className);
    
    if (isInstanceMethod) {
        originalMethod = class_getInstanceMethod(clazz, originalSelector);
        swizzledMethod = class_getInstanceMethod(clazz, swizzledSelector);
        method_exchangeImplementations(originalMethod, swizzledMethod);
    } else {
        originalMethod = class_getClassMethod(myClazz, originalSelector);
        swizzledMethod = class_getClassMethod(myClazz, swizzledSelector);
        BOOL didAddMethod = class_addMethod(myClazz, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(myClazz, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    }
}

+ (void)swizzleInstanceMethod:(SEL)originalSelector with:(SEL)swizzledSelector forClass:(Class)clazz {
    
    Method originalMethod = class_getInstanceMethod(clazz, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(clazz, swizzledSelector);
    method_exchangeImplementations(originalMethod, swizzledMethod);
}

+ (void)swizzleClassMethod:(SEL)originalSelector with:(SEL)swizzledSelector forClass:(Class)clazz {
    const char *className = [NSStringFromClass(clazz.self) UTF8String];
    Class myClazz = objc_getMetaClass(className);
    
    Method originalMethod = class_getClassMethod(myClazz, originalSelector);
    Method swizzledMethod = class_getClassMethod(myClazz, swizzledSelector);
    method_exchangeImplementations(originalMethod, swizzledMethod);
}

@end
