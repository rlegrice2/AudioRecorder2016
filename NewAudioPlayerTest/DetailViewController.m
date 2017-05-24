//
//  DetailViewController.m
//  NewAudioPlayerTest
//
//  Created by MacBook_RG on 1/5/16.
//  Copyright (c) 2016 Richard Grice. All rights reserved.
//

#import "DetailViewController.h"
//#import "FileViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize audioNameLabel;
@synthesize audioName = _audioName;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self =   [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    audioNameLabel.text = _audioName;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
