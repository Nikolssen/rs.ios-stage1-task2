#import "TimeConverter.h"

@implementation TimeConverter
// Complete the following function
- (NSString*)convertFromHours:(NSString*)hours minutes:(NSString*)minutes {
    NSMutableString *result = [NSMutableString new];
    NSDictionary *dateToString = @{
    
            @"1": @"one",
            @"2": @"two",
            @"3": @"three",
            @"4": @"four",
            @"5": @"five",
            @"6": @"six",
            @"7": @"seven",
            @"8": @"eight",
            @"9": @"nine",
            @"10":@"ten",
            @"11":@"eleven",
            @"12":@"twelve",
            @"13":@"thirteen",
            @"14":@"fourteen",
            @"15":@"quarter",
            @"16":@"sixteen",
            @"17":@"seventeen",
            @"18":@"eightteen",
            @"19":@"nineteen",
            @"20":@"twenty",
            @"21":@"twenty one",
            @"22":@"twenty two",
            @"23":@"twenty three",
            @"24":@"twenty four",
            @"25":@"twenty five",
            @"26":@"twenty six",
            @"27":@"twenty seven",
            @"28":@"twenty eight",
            @"29":@"twenty nine",
            @"30":@"half"
           
    };
    

    if (([minutes intValue] >=1)&&([minutes intValue]<=30)) {
        NSString *newMinutes = [NSString stringWithFormat:@"%d", ([minutes intValue])];
        [result appendString: dateToString[newMinutes]];
        if ([minutes intValue] != 15 && [minutes intValue] != 30)
            [result appendString:@" minutes"];
        [result appendString:@" past "];
        [result appendString:dateToString[hours]];
    }
        else if ([minutes intValue]==0) {
        [result appendString:dateToString[hours]];
        [result appendString:@" o' clock"];
          
    }
        else if ([minutes intValue]<60) {
        NSString *newHours =[NSString stringWithFormat: @"%d",[hours intValue]+1];
        NSString *newMinutes = [NSString stringWithFormat:@"%d", (60-[minutes intValue])];
        [result appendString: dateToString[newMinutes]];
        if ([newMinutes intValue] != 15)
            [result appendString:@" minutes"];
        [result appendString:@" to "];
        [result appendString:dateToString[newHours]];
            
    
    }

    return result;
}
@end
