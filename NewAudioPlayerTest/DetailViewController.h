//
//  DetailViewController.h
//  NewAudioPlayerTest
//
//  Created by MacBook_RG on 1/5/16.
//  Copyright (c) 2016 Richard Grice. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FileViewController.h"

@interface DetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *audioNameLabel;

// This is the name of the cell selected in the FileViewController TableView
// that will prepareForSegue and the selected file name will display
//in the DetalViewController/storyBoard.
@property (nonatomic, strong) NSString *audioName;


@end
