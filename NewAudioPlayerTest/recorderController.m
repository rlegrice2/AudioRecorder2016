//
//  recorderController.m
//  NewAudioPlayerTest
//
//  Created by MacBook_RG on 2/8/16.
//  Copyright (c) 2016 Richard Grice. All rights reserved.
//

//02/15/16
// All recording components and instances are contained in this file.

#import "recorderController.h"
#import <AVFoundation/AVFoundation.h>

@interface recorderController () <AVAudioRecorderDelegate>

@property (strong, nonatomic) AVAudioPlayer *myPlayer;
@property (strong, nonatomic) AVAudioRecorder *myRecorder;
@property (strong, nonatomic) RecordingStopCompletionHandler completionHandler;

@end

@implementation recorderController

- (id)init {
    self = [super init];
    if (self) {
NSString *tmpDir = NSTemporaryDirectory();
//        NSString *docDir = NSDocumentDirectory();
NSString *filePath = [tmpDir stringByAppendingPathComponent:@"audio 1.caf"];
//        NSString *filePath = [NSDocumentDirectory stringByAppendingPathComponent:@"audio.caf"];
    }
    return self;
}



@end
