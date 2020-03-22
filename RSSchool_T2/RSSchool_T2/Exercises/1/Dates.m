#import "Dates.h"

@implementation Dates

- (NSString *)textForDay:(NSString *)day month:(NSString *)month year:(NSString *)year {
    
    
    NSCalendar *myCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.year = [year integerValue];
    components.month = [month integerValue];
    components.day = [day integerValue];
    if ([components isValidDateInCalendar:myCalendar]) {
        NSDateFormatter *formater = [[NSDateFormatter alloc] init];
        [formater setLocale:[NSLocale localeWithLocaleIdentifier:@"ru"]];
        formater.dateFormat =@"d MMMM, EEEE";
        NSDate *date = [myCalendar dateFromComponents:components];
        
        NSString *result = [[NSString alloc] initWithFormat:@"%@", [formater stringFromDate:date]];
        return result;
        
    }
    else
    return @"Такого дня не существует";
}

@end
