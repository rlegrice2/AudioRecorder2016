//
//  ViewController.h
//  NewAudioPlayerTest
//
//  Created by MacBook_RG on 9/29/15.
//  Copyright (c) 2015 Richard Grice. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioServices.h>
#import "FileViewController.h"
#import "recorderController.h"


@interface MainViewController : UIViewController <AVAudioRecorderDelegate, AVAudioPlayerDelegate, AVAudioSessionDelegate>
{
    NSTimer *recordTimer;
    NSMutableArray *audioFileArray;
    NSInteger *arrayCount;

}
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;


@property (strong, nonatomic) IBOutlet UIButton *play;

@property (strong, nonatomic) IBOutlet UIButton *recordPause;
@property (strong, nonatomic) IBOutlet UIButton *stop;

@property (nonatomic,strong) IBOutlet UILabel *timeLabel;
//my add ons
@property (nonatomic, strong) NSArray *fileList;
@property (strong, nonatomic) NSMutableArray *memos;

//@property (nonatomic,strong) IBOutlet UIButton *chooseButton;
//
//@property (nonatomic,strong) IBOutlet UIButton *skipForwardButton;
//@property (nonatomic,strong) IBOutlet UIButton *skipBackwardsButton;

- (IBAction)recordPressed:(UIButton *)sender;
- (IBAction)playPressed:(UIButton *)sender;
- (IBAction)stopPressed:(UIButton *)sender;


@property (strong, nonatomic) recorderController *controller;
@property (strong, nonatomic) NSArray* audioFileArray;
@property (readonly) NSString* filePath;
@property (nonatomic, strong) NSString *dateString;

//@property (nonatomic,strong) NSString *selectedFilePath;

@property (nonatomic, strong) AVAudioPlayer *myPlayer;
@property (nonatomic, strong) AVAudioRecorder *myRecorder;
@property (nonatomic,strong) IBOutlet UIProgressView *progressBar;
@property (nonatomic,strong) NSTimer *timer;

//-(IBAction)play:(id)sender;
//-(IBAction)skipForward:(id)sender;
//-(IBAction)skipBackward:(id)sender;

//Shared manager singleton

@end

