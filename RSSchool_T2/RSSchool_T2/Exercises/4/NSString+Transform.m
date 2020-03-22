#import "NSString+Transform.h"

@implementation NSString (Transform)

-(NSString*)transform {
    NSCharacterSet *vovelSet = [NSCharacterSet characterSetWithCharactersInString:@"AEIOUYaeiouy"];
    NSCharacterSet *consonantSet =[NSCharacterSet characterSetWithCharactersInString:@"BCDFGHJKLMNPQRSTVWXZbcdfghjklmnpqrstvwxz"];
    NSString *capitalized = [self uppercaseString];
    NSCharacterSet *letterSet = [NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZ"];
    NSCharacterSet *myStringSet = [NSCharacterSet characterSetWithCharactersInString:capitalized];
    NSMutableArray <NSString*> *wordArray =[[self componentsSeparatedByString:@" "] mutableCopy];
    NSMutableArray <NSString*> *resultArray = [NSMutableArray new];
    NSRange range = NSMakeRange(0, 1);
    if ([myStringSet isSupersetOfSet:letterSet]) { //Pangram
        for (NSString *word in wordArray) {
            if ([word isEqualToString:@""]) continue;
            NSMutableString *tempString =  [NSMutableString stringWithString:word];
            int counter=0;
            for (int i=0; i<[word length]; i++) {
                if ([vovelSet characterIsMember:[tempString characterAtIndex:i]]) {
                   // [[tempString objectAtIndex:i] uppercaseString];
                    range.location = i;
                    NSString *curChar = [word substringWithRange:range];
                    [tempString replaceCharactersInRange:range withString:[curChar uppercaseString]];
                    counter++;
                     }
                }
            NSString *counterChar = [NSString stringWithFormat:@"%d" , counter];
            [tempString insertString:counterChar atIndex:0];
            [resultArray addObject:tempString];
         }
      
            }
    else // Not Pangram
    {
        for (NSString *word in wordArray) {
                   if ([word isEqualToString:@""]) continue;
                   NSMutableString *tempString =  [NSMutableString stringWithString:word];
                   int counter=0;
                   for (int i=0; i<[word length]; i++) {
                       if ([consonantSet characterIsMember:[tempString characterAtIndex:i]]) {
                           range.location = i;
                           NSString *curChar = [word substringWithRange:range];
                           [tempString replaceCharactersInRange:range withString:[curChar uppercaseString]];
                           counter++;
                            }
                       }
                   NSString *counterChar = [NSString stringWithFormat:@"%d" , counter];
                   [tempString insertString:counterChar atIndex:0];
            [resultArray addObject:tempString];
                }
    }
    
     [resultArray sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
           
           NSString *word1 = (NSString *)obj1;
           NSString *word2 = (NSString *)obj2;
           
           NSRange firstCharacterRange = NSMakeRange(0, 1);
           int firstCharacterValue = [[word1 substringWithRange:firstCharacterRange] intValue];
           int secondCharacterValue = [[word2 substringWithRange:firstCharacterRange] intValue];
           
           if (firstCharacterValue < secondCharacterValue) {
               return NSOrderedAscending;
           } else if (firstCharacterValue == secondCharacterValue) {
               return NSOrderedSame;
           } else {
               return NSOrderedDescending;
           }
       }];
    
  
  NSString *stringToReturn = [resultArray componentsJoinedByString:@" "];
    NSLog(stringToReturn);
       return stringToReturn;
}

@end
