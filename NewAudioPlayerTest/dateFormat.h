//
//  dateFormat.h
//  NewAudioPlayerTest
//
//  Created by MacBook_RG on 06/12/2016.
//  Copyright (c) 2016 Richard Grice. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface dateFormat : NSObject
{
    NSString *dateString;
}
@property (nonatomic, readonly) NSString *formattedDate;
@property (nonatomic, readonly) NSString *dateString;


@end
