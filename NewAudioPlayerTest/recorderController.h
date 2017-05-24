//
//  recorderController.h
//  NewAudioPlayerTest
//
//  Created by MacBook_RG on 2/8/16.
//  Copyright (c) 2016 Richard Grice. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol RecordingControllerDelegate <NSObject>
-(void)interuptionsBegan;
@end

typedef void(^RecordingStopCompletionHandler)(BOOL);
typedef void(^RecordingSaveCompletionHandler)(BOOL, id);

@class myMemo;
@interface recorderController : NSObject

@property (readonly) NSString* filePath;

//@property (nonatomic, readonly) NSString *formattedCurrentTime;

- (BOOL)record;

- (void)pause;

- (void)stopWithCompletionHandler:(RecordingStopCompletionHandler)handler;

- (void)saveRecordingCompletionHandler:(NSString *)name completionHandler:(RecordingSaveCompletionHandler)handler;

//player methods
- (BOOL)playBackRecording:(myMemo *) memo;


@end
