//
//  FileViewController.h
//  NewAudioPlayerTest
//
//  Created by MacBook_RG on 10/12/15.
//  Copyright (c) 2015 Richard Grice. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioServices.h>
#import "MainViewController.h"


//@protocol FileControllerDelegate <NSObject>
//-(void) cancel;
//-(void) didFinishWithFile:(NSString *)filePath;
//@end

@interface FileViewController : UITableViewController<UITableViewDataSource, UITableViewDelegate>
{
    //NSArray *audioFileArray;
   // NSMutableArray *audioFileArray;
    NSArray *myImage;
    //NSURL *fileURL;
    //NSArray *contents;
}
@property (nonatomic,strong) NSMutableArray *fileArray;
@property (nonatomic,strong) NSMutableArray *audioFileArray;
@property (nonatomic,strong) NSArray *filteredArray;
//@property (nonatomic,strong) NSMutableArray *audioFileArray;
@property (nonatomic, weak) NSString *fileName;
@property (nonatomic, strong) NSArray *myimage;
@property (nonatomic, strong) NSArray *contents;
@property (nonatomic, strong) NSURL *fileURL;
//@property (nonatomic, strong) NSURL *fileURL;
//@property (nonatomic, strong) id <FileControllerDelegate> delegate;

- (IBAction)closeView:(id)sender;







@end
