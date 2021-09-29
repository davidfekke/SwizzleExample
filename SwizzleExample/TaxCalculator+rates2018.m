//
//  TaxCalculator+rates2018.m
//  SwizzleExample
//
//  Created by David Fekke on 9/29/21.
//

#import "TaxCalculator+rates2018.h"
#import "SimpleSwizzleHelper.h"

@implementation TaxCalculator (rates2018)

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


-(NSNumber *)swizzle_whatAreMyTaxes {
    float rev = [self.revenue floatValue];
    float taxesDue = 0.21 * rev;
    NSNumber *nsTaxesDue = [NSNumber numberWithFloat:taxesDue];
    return nsTaxesDue;
}

@end
