# SimpleSwizzleExample

This is an example project I wrote to show how to simply swizzle an Obj-C method using the Objective-C runtime.

The method signature for the SimpleSwizzleHelper is as follows;

```objective-c
+ (void)swizzleMethod:(SEL)originalSelector with:(SEL)swizzledSelector forClass:(Class)clazz isInstanceMethod:(BOOL)isInstanceMethod
```

If you want to swizzle out a method in a class you do not want to change or cannot change the source, simply create a category for that class, create the replacement method and use the load method to swizzle the methods.


Here is an example of a method that has been swizzled in the TaxCalculator+rates2018 category;

```objective-c
+ (void) load {
    if (self == TaxCalculator.self) {
        [self enableSwizzledMethods];
    }
}

+ (void) enableSwizzledMethods {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(whatAreMyTaxes);
        SEL swizzledSelector = @selector(swizzle_whatAreMyTaxes);
        [SimpleSwizzleHelper swizzleMethod:originalSelector with:swizzledSelector forClass:class isInstanceMethod:YES];
    });
}
```
