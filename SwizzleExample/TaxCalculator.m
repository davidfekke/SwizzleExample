//
//  TaxCalculator.m
//  SwizzleExample
//
//  Created by David Fekke on 9/29/21.
//

#import "TaxCalculator.h"

@implementation TaxCalculator

- (instancetype)init
{
    self = [super init];
    if (self) {
        _revenue = 0;
    }
    return self;
}

-(NSNumber *)whatAreMyTaxes {
    float rev = [self.revenue floatValue];
    float taxesDue = 0.39 * rev;
    NSNumber *nsTaxesDue = [NSNumber numberWithFloat:taxesDue];
    return nsTaxesDue;
}

@end
