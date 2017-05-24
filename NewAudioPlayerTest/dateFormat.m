//
//  dateFormat.m
//  NewAudioPlayerTest
//
//  Created by MacBook_RG on 06/12/2016.
//  Copyright (c) 2016 Richard Grice. All rights reserved.
//

#import "dateFormat.h"

@implementation dateFormat

// Date stamp set up 11/27/16
//NSString *dateString;
- (NSString *)formattedDate {
NSDate *aDate = [NSDate date];
NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
[dateFormatter setDateFormat:@"yyyy-MM-dd-HH-mm-ss"];
dateString = [dateFormatter stringFromDate:aDate];


return dateString;
    NSLog(@"datestring %@", dateString);
}
@end

