//
//  FileViewController.m
//  NewAudioPlayerTest
//
//  Created by MacBook_RG on 10/12/15.
//  Copyright (c) 2015 Richard Grice. All rights reserved.
//
#import <Foundation///Foundation.h>
#import "FileViewController.h"
#import "DetailViewController.h"
#import "MainViewController.h"
#import "dateFormat.h"

@interface FileViewController ()

@end

@implementation FileViewController
int count;
@synthesize fileArray = _fileArray;
@synthesize fileName = _fileName;
@synthesize audioFileArray = _audioFileArray;
@synthesize contents = _contents;
@synthesize fileURL = _fileURL;
@synthesize filteredArray = _filteredArray;
//@synthesize dateString;

- (void)viewDidLoad {
    [super viewDidLoad];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    _audioFileArray = [[NSMutableArray alloc] init];
    //_audioFileArray = [[NSMutableArray alloc] init];
    
// Added 7/3/16
    _fileName = [NSString stringWithFormat:@"audio %d.caf", count];
// <---
    
    
//    NSArray *paths = [NSArray arrayWithObjects:[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject]];
    
    NSArray *paths = [NSArray arrayWithObjects:[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject],
    _fileName,
    nil];
    
    NSString *documentsDirectory = [paths objectAtIndex:0];
//    _fileURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@%@", paths, _fileName]];
    
    // WORKS with this, but whole mangled URL
_fileURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@",[paths objectAtIndex:0]]];
    
    NSError *error = nil;
    
//  To flter out the .DS_store file, show only audio.caf files
    
     _audioFileArray = [fileManager contentsOfDirectoryAtPath:documentsDirectory error:&error];
    //NSPredicate *predicate = [NSPredicate predicateWithFormat:<#(NSString *)#> argumentArray:<#(NSArray *)#>;
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF ENDSWITH [cd] %@", @".caf"];
    _filteredArray = [_audioFileArray filteredArrayUsingPredicate:predicate];
    //NSPredicate *datePredicate = [NSPredicate predicateWithFormat:@"date == %@", dateString];
    
    _contents = [fileManager contentsOfDirectoryAtURL:_fileURL includingPropertiesForKeys:[NSArray arrayWithObject:NSURLNameKey] options:NSDirectoryEnumerationSkipsHiddenFiles error:nil];
    
//  Not use for now..
    NSArray *theFiles =  [fileManager contentsOfDirectoryAtURL:[NSURL fileURLWithPath:[paths objectAtIndex:0]]
                                    includingPropertiesForKeys:[NSArray arrayWithObject:NSURLNameKey]
                                                       options:NSDirectoryEnumerationSkipsHiddenFiles
                                                         error:nil];
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"pathExtension='.caf'"];
//    [_audioFileArray filteredArrayUsingPredicate:predicate];
    
    NSLog(@"THE FILES ---> %@",theFiles);
    NSLog(@"now predicate ---> %@",predicate);
    NSLog(@"filteredArray ---> %@",_filteredArray);
    
//    NSArray *contents = [fileManager contentsOfDirectoryAtPath:documentsDirectory error:nil];
//    NSUInteger numberOfFiles = [contents count];
//    if ([contents indexOfObject:@".DS_Store"] != NSNotFound)
//        numberOfFiles--;
    
    //if (_contents) {
        NSLog(@"contents log -------> :%@", _contents);
    //}
    //_fileArray = [[NSMutableArray alloc]initWithObjects:_audioFileArray, nil];
    
    /* test for file filtering on 7/11/16
    
    for (int i = 0; i < [_audioFileArray count]; i++)
    {
        
        documentsDirectory = [NSString stringWithFormat:@"%@/%d",documentsDirectory,[_audioFileArray objectAtIndex:i] ];
        
        if (![[_audioFileArray objectAtIndex:i]isEqualToString:@".DS_Store"])
        {
            //UIImage *myimage = [UIImage imageWithContentsOfFile:imageName];
            _fileArray = [[NSMutableArray alloc]initWithObjects:_audioFileArray, nil];
*/
    
//        _fileArray = [[NSMutableArray alloc]initWithObjects:@"clothes",
//                      @"soda",
//                     @"put trash out"
//                     ,
//                     @"win some money"
//                     ,
//                     @"make some food"
//                     ,nil];
        
        
        NSLog(@"array count: %d\n",[_fileArray count]);
        NSLog(@"items list: %@\n\n",_fileArray);
    NSLog(@"AudioFileArray check: %@\n\n",_audioFileArray);
    NSLog(@"tableview docsDir created ------%@", documentsDirectory);
    NSLog(@"name of files if there --->: %@\n",_fileName);
    NSLog(@"file URL --->: %@,%@\n", _fileURL, _fileName);
    NSLog(@"paths --->: %@", paths);
    NSLog(@"contents log:%@", _contents);
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [_filteredArray count];
}

//-(IBAction)closeView:(id)sender
//{
//  [self.delegate cancel];
//    //[self dismissModalViewControllerAnimated: YES];
//}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *simpleTableIdentifier = @"simpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:simpleTableIdentifier];
    }
    NSString *name = [_filteredArray objectAtIndex:indexPath.row];
    //add the text display that is drawn from the array list
    cell.textLabel.text = name;
    cell.textLabel.text = [_filteredArray objectAtIndex:indexPath.row];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ is the recorded date", name];
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    //} else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"audioFileDetail"]) {NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        DetailViewController *destViewController = segue.destinationViewController;
        destViewController.audioName = [_filteredArray objectAtIndex:indexPath.row];
        
        NSLog(@"selected row: %ld", (long)indexPath.row);
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

// IBAction connected to the "cancel" button in the FileViewController
- (IBAction)closeView:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)toggle:(id)sender{

    [self.tableView setEditing:YES];
}

- (IBAction)cancel:(id)sender {
}
@end
    

