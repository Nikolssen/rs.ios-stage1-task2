#import "FibonacciResolver.h"

@implementation FibonacciResolver
- (NSArray*)productFibonacciSequenceFor:(NSNumber*)number {
    NSMutableArray <NSNumber*> *FibonacciArr = [NSMutableArray new];
    [FibonacciArr addObject:@0];
    [FibonacciArr addObject:@1];
    int i = 1;
    NSMutableArray *result = [NSMutableArray new];
    while (true)
    {
        if ([FibonacciArr[i-1] intValue] * [FibonacciArr[i] intValue] == [number intValue]) {
            [result addObject:FibonacciArr[i-1]];
            [result addObject:FibonacciArr[i]];
            [result addObject:@1];
            return result;
        }
        else  if ([FibonacciArr[i-1] intValue] * [FibonacciArr[i] intValue] > [number intValue]) {
            
            [result addObject:FibonacciArr[i-1]];
            [result addObject:FibonacciArr[i]];
            [result addObject:@0];
            return result;
            }
        else {
            [FibonacciArr addObject:[NSNumber numberWithInt:([FibonacciArr[i] intValue]+[FibonacciArr[i-1] intValue] )]];
            i++;
        }
    }
    return @[];
}
@end
