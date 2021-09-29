//
//  TaxCalculator.h
//  SwizzleExample
//
//  Created by David Fekke on 9/29/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TaxCalculator : NSObject

@property (nonatomic, retain) NSNumber *revenue;

-(NSNumber *)whatAreMyTaxes;

@end

NS_ASSUME_NONNULL_END
