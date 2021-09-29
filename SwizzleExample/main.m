//
//  main.m
//  SwizzleExample
//
//  Created by David Fekke on 9/29/21.
//

#import <Foundation/Foundation.h>
#import "TaxCalculator.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TaxCalculator *calc = [[TaxCalculator alloc] init];
        calc.revenue = [NSNumber numberWithInteger:100000];
        NSNumber *taxesOwed = [calc whatAreMyTaxes];
        NSLog(@"My taxes for 100000 are $%@", [taxesOwed stringValue]);
    }
    return 0;
}
