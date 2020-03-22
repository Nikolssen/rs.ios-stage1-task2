#import "AbbreviationMaker.h"

@implementation AbbreviationMaker
// Complete the abbreviation function below.
- (NSString *) abbreviationFromA:(NSString *)a toB:(NSString *)b {

    NSCharacterSet *bSet = [NSCharacterSet characterSetWithCharactersInString:b];
    NSCharacterSet *notBSet = [bSet invertedSet];
 
    NSArray <NSString *> *arrayOfCommonCharacters = [[a uppercaseString] componentsSeparatedByCharactersInSet: notBSet];
        NSString *result = [arrayOfCommonCharacters componentsJoinedByString:@""];
        if ([result isEqualToString:b]) return @"YES";
        else return @"NO";
    
}
@end
