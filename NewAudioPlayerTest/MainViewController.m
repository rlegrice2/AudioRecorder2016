//
//  ViewController.m
//  NewAudioPlayerTest
//
//  Created by MacBook_RG on 9/29/15.
//  Copyright (c) 2015 Richard Grice. All rights reserved.
//

#import "MainViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "FileViewController.h"
#import "recorderController.h"
//#import "dateFormat.h"


@interface MainViewController () <RecordingControllerDelegate>
{
    AVAudioPlayer *myPlayer;
    AVAudioRecorder *myRecorder;
    NSMutableDictionary *recordSettings;
    NSURL *newURL;
    NSString *documentsDirectory;
    NSString *filename;
    NSString *dateString;
}

@end

@implementation MainViewController

@synthesize fileList = _fileList;

@synthesize recordPause = _recordPause;
@synthesize play = _play;
@synthesize stop = _stop;
@synthesize audioFileArray = _audioFileArray;
@synthesize myPlayer = _myPlayer;
@synthesize myRecorder = _myRecorder;
@synthesize filePath = _filePath;
//@synthesize filename = _filename;

- (void)viewDidLoad {
    [super viewDidLoad];
    //load recorController
    _controller = [[recorderController alloc]init];
    
// Date stamp set up 11/27/16
//    NSString *dateString;
//    NSDate *aDate = [NSDate date];
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
//    dateString = [dateFormatter stringFromDate:aDate];
//    NSLog(@"datestring %@",dateString);
    
    
    
    //set up/create an audio session
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [session setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    UInt32 audioRouteOverride = kAudioSessionOverrideAudioRoute_Speaker;
    AudioSessionSetProperty (kAudioSessionProperty_OverrideAudioRoute,
                             sizeof (audioRouteOverride),&audioRouteOverride);
    
    // Define the recorder setting
    NSMutableDictionary *recordSetting = [[NSMutableDictionary alloc] init];
    
    [recordSetting setValue:[NSNumber numberWithInt:kAudioFormatMPEG4AAC] forKey:AVFormatIDKey];
    [recordSetting setValue:[NSNumber numberWithFloat:44100.0] forKey:AVSampleRateKey];
    [recordSetting setValue:[NSNumber numberWithInt:2] forKey:AVNumberOfChannelsKey];
    
    myRecorder.delegate = self;
    myRecorder.meteringEnabled = YES;
    [myRecorder prepareToRecord];
    
    [_stop setEnabled:NO];
    [_play setEnabled:NO];
    
    //[self setup];
   
}

- (void) setup{
    //Disable stop and play buttons when application launches
    [_stop setEnabled:NO];
    [_play setEnabled:NO];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    _audioFileArray = [[NSMutableArray alloc] init];
    NSError *error = nil;
    //docDir = [pathComponents objectAtIndex:0];
    

    
    //set up/create an audio session
//    NSError *error = nil;
//    AVAudioSession *session = [AVAudioSession sharedInstance];
//    [session setCategory:AVAudioSessionCategoryPlayAndRecord error:&error];
//    if (error == nil) {
//        NSLog(@"audio session initialized successfully");
//    } else {
//        NSLog(@"error initializing audio session: %@", [error description]);
//    }
//    UInt32 audioRouteOverride = kAudioSessionOverrideAudioRoute_Speaker;
//    AudioSessionSetProperty (kAudioSessionProperty_OverrideAudioRoute,
//                             sizeof (audioRouteOverride),&audioRouteOverride);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma AVControl and actions




- (IBAction)recordPressed:(UIButton *)sender {
   if (myPlayer.playing) {
       //[_recordPause setBackgroundImage:[UIImage imageNamed:@"Record.png"]forState:UIControlStateNormal];
       [myPlayer stop];
       NSLog(@"record pressed");
   }
    if (!myRecorder.recording)
    {
        if([self.recordPause.currentTitle isEqualToString:@"Record"])
        {
            
            //New setup
            //filename = [NSString stringWithFormat:@"audio%@.caf",[NSNumber numberWithFloat:[_soundFileArray count]]];
            
            NSArray *pathComponents = [NSArray arrayWithObjects:
                                       [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject],
                                       _filePath,
                                       nil];
            newURL = [NSURL fileURLWithPathComponents: pathComponents];
            _filePath = [documentsDirectory stringByAppendingPathComponent:@"audio %@ %@.caf"];
            // Initiate and prepare the recorder
            //NSInteger count = 0;
//            NSString *dateString;
//            NSDate *aDate = [NSDate date];
//            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//            [dateFormatter setDateFormat:@"yyyy-MM-dd"];
//            dateString = [dateFormatter stringFromDate:aDate];
//            NSLog(@"datestring %@",dateString);
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:@"dd-MM-yyyy"];
            NSDate *currentDate = [NSDate date];
            NSString *dateString = [formatter stringFromDate:currentDate];
            NSLog(@"datestring %@",dateString);
            
            int count = 0;
            int arrayCount = [audioFileArray count];

//            if([pathComponents count] > 0) {
            
                documentsDirectory = [pathComponents objectAtIndex:0];
            
                NSError *error = nil;
                _audioFileArray = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:documentsDirectory error:&error];
                filename = [NSString stringWithFormat:@"audio %@ %@.caf", dateString,[NSNumber numberWithFloat:[_audioFileArray count]]];
                        count ++;
                //filename = [NSString stringWithFormat:@"audio %@ %@.caf", _audioFileArray, dateString],
            
                // NSLog updates
                NSLog(@"soundFileArray is #######:%@\n\n",_audioFileArray);
                //NSLog(@"filename being now created -->:%@\n\n",filename);
                NSArray *index=[pathComponents lastObject];
                NSLog(@"index=%@\n\n",index);
                NSLog(@"pathcomponents count =%lu\n\n",(unsigned long)[pathComponents count]);
                //NSInteger count = [_soundFileArray count];
                NSLog(@"docDir count when record pressed ------%@", documentsDirectory);
                
                
            //}
            
            _filePath = [documentsDirectory stringByAppendingPathComponent:filename];
            
            myRecorder =  [[AVAudioRecorder alloc] initWithURL:[NSURL fileURLWithPath:_filePath] settings:recordSettings error:NULL];
            myRecorder.delegate = self;
            myRecorder.meteringEnabled = YES;
            //[myRecorder prepareToRecord];
            // End of setup
        }
        
        AVAudioSession *session = [AVAudioSession sharedInstance];
        [session setActive:YES error:nil];
        //start recording
        [myRecorder record];
        [_recordPause setBackgroundImage:[UIImage imageNamed:@"PauseOff.png"]forState:UIControlStateNormal];
        [_recordPause setTitle:@"Pause" forState:UIControlStateNormal];
        
//        recordTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(recordUpdate) userInfo:nil repeats:YES];
//        NSLog(@"session is recording, %@", recordTimer);
//        NSLog(@"----> recorderFilePath <------: %@",_filePath);
        //[self.AudioPicker reloadAllComponents];
        //[self setup];
    }
    else
    {
        
        //pause recording
        [myRecorder pause];
        [_recordPause setBackgroundImage:[UIImage imageNamed:@"Record.png"]forState:UIControlStateNormal];
        [_recordPause setTitle:@"Resume" forState:UIControlStateNormal];
    }
    
    [_stop setEnabled:YES];
    [_play setEnabled:NO];


 /*   if ([self.myRecorder isRecording]) {
        [self.myRecorder stop];
        [_recordPause setTitle:@"Record" forState:UIControlStateNormal];
        // needed when myPlayer is working
        [myPlayer stop];
    }
        if (!myRecorder.recording)
        {
            if ([self.recordPause.currentTitle isEqualToString:@"Record"]) {
            
//        }
//    }
//    } else {
        
        NSError *error;
        
        AVAudioSession *audioSession = [AVAudioSession sharedInstance];
        [audioSession setCategory:AVAudioSessionCategoryPlayAndRecord error:&error];
        
        if (error == nil) {
     
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
   /* NSArray *paths = [NSArray arrayWithObjects:
            [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject],
            _filename,
            nil];
    */
/*            documentsDirectory = [paths objectAtIndex:0];
            
            NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"audio 1.caf"];
            NSInteger count = 0;
           
            
            
//            if([paths count] > 0) {

            
                //documentsDirectory = [paths objectAtIndex:0];
                
                NSError *error = nil;
                _audioFileArray = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:documentsDirectory error:&error];
            
            while ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
                NSString *fileName = [NSString stringWithFormat:@"audio %@.caf", [NSNumber numberWithFloat:[_audioFileArray count]]];
                filePath = [documentsDirectory stringByAppendingPathComponent:fileName];
                count ++;
            }
                NSURL *fileURL = [NSURL fileURLWithPath:filePath];
                NSLog(@"URL name, %@\n\n", fileURL);
                
                self.myRecorder =  [[AVAudioRecorder alloc] initWithURL:fileURL settings:recordSettings error:&error];
                
                
                if (error == nil) {
                    AVAudioSession *session = [AVAudioSession sharedInstance];
                    [session setActive:YES error:nil];
                    
                //start recording
                    [self.myRecorder record];
                    [_recordPause setTitle:@"Pause" forState:UIControlStateNormal];
                
                }else{
                    
                //pause recording
                    [self.myRecorder pause];
                    //[_recordPause setBackgroundImage:[UIImage imageNamed:@"Record.png"]forState:UIControlStateNormal];
                    [_recordPause setTitle:@"STOP" forState:UIControlStateNormal];

                }
            
                 NSLog(@"error initializing audio recording: %@", [error description]);
                
            }else{
                
                NSLog(@"error initializing audio session: %@", [error description]);
                
            }
            
        }
//        else
//        {
//            
//            //pause recording
//            [self.myRecorder pause];
//            //[_recordPause setBackgroundImage:[UIImage imageNamed:@"Record.png"]forState:UIControlStateNormal];
//            [_recordPause setTitle:@"STOP" forState:UIControlStateNormal];
//        }
        
        [_stop setEnabled:YES];
        [_play setEnabled:NO];
        
        //myRecorder.delegate = self;
                //myRecorder.meteringEnabled = YES;
            }
            
    //My add ons for testing 2/16/16
        //_fileList = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:documentsDirectory error:nil];
        
        NSLog(@"audio files in array, %@\n\n", _fileList);
        NSLog(@"documents path, %@\n\n", documentsDirectory);
*/

        
           
    
        
    //}
    //NSLog(@"record pressed");
}

-(void) audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder successfully:(BOOL)flag{
    //[_recordPause setBackgroundImage:[UIImage imageNamed:@"Record.png"]forState:UIControlStateNormal];
    [_recordPause setTitle:@"Record" forState:UIControlStateNormal];
    
    [_stop setEnabled:NO];
    [_play setEnabled:YES];
    NSLog(@"session did finish recording");
}


- (IBAction)stopPressed:(UIButton *)sender {
    

        if ([myRecorder isRecording]) {
    
    [myRecorder stop];
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [session setActive:NO error:nil];
    
    [_recordPause setTitle:@"Record" forState:UIControlStateNormal];
    //[_play setEnabled:YES];
        }
    NSLog(@"recording stopped");
}
- (IBAction)playPressed:(UIButton *)sender {

}
@end
