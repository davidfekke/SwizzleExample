//
//  SimpleSwizzleHelper.h
//  SwizzleExample
//
//  Created by David Fekke on 9/29/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SimpleSwizzleHelper : NSObject

+ (void)swizzleMethod:(SEL)originalSelector with:(SEL)swizzledSelector forClass:(Class)clazz isInstanceMethod:(BOOL)isInstanceMethod;
+ (void)swizzleInstanceMethod:(SEL)originalSelector with:(SEL)swizzledSelector forClass:(Class)clazz;
+ (void)swizzleClassMethod:(SEL)originalSelector with:(SEL)swizzledSelector forClass:(Class)clazz;

@end

NS_ASSUME_NONNULL_END
