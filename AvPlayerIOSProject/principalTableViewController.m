//
//  principalTableViewController.m
//  AvPlayerIOSProject
//
//  Created by Fabian Rosales on 12/2/15.
//  Copyright © 2015 KeyBellSoftCR. All rights reserved.
//

#import "principalTableViewController.h"
#import "AppDelegate.h"
#import "SaveVideoTableViewController.h"
#import "VIDEOS.h"
#import "VideoViewController.h"
#import "XtremVideosViewController.h"
@interface principalTableViewController ()
{
    NSMutableArray *arrayToShowTheVideos;
    AppDelegate *appDelegateIntance;
    NSManagedObject *selectedVideo;
    BOOL firstTime;
}
@end

@implementation principalTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setInitialVariables];
    firstTime=YES;
    
    #warning THIS CODE IS FOR DELETE ALL VIDEOS
    /*NSFetchRequest *allData = [[NSFetchRequest alloc] init];
    [allData setEntity:[NSEntityDescription entityForName:@"VIDEOS" inManagedObjectContext:appDelegateIntance.managedObjectContext]];
    [allData setIncludesPropertyValues:NO]; //only fetch the managedObjectID
    
    NSError *error = nil;
    NSArray *arrayEntities = [appDelegateIntance.managedObjectContext executeFetchRequest:allData error:&error];
    
    //error handling goes here
    for (NSManagedObject *entityObject in arrayEntities) {
        [appDelegateIntance.managedObjectContext deleteObject:entityObject];
    }
    NSError *saveError = nil;
    [appDelegateIntance.managedObjectContext save:&saveError];
    //more error handling here
    */
    
    arrayToShowTheVideos = [[NSMutableArray alloc]init];
    arrayToShowTheVideos=[self fetchCoreData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// set the principal variables
- (void)setInitialVariables
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    appDelegateIntance= appDelegate;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

//have the array count
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [arrayToShowTheVideos count];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    selectedVideo = [arrayToShowTheVideos objectAtIndex:indexPath.row];
    XtremVideosViewController *viewController = [[XtremVideosViewController alloc] init];
    viewController.globalVideos = (VIDEOS *)selectedVideo;
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 0)//OK button pressed
    {
        VideoViewController *viewController = [[VideoViewController alloc] init];
        viewController.globalVideos = (VIDEOS *)selectedVideo;
        [self.navigationController pushViewController:viewController animated:YES];
        // [self performSegueWithIdentifier:@"xtremv" sender:self];
    }
    else if(buttonIndex == 1)//Annul button pressed.
    {
        [self performSegueWithIdentifier:@"xtremv" sender:self];
    }
}


//this method configure the cells one by one
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    VIDEOS *videos = [arrayToShowTheVideos objectAtIndex:indexPath.row];
    cell.textLabel.text = videos.name_video;
    return cell;
}


-(NSMutableArray *)fetchCoreData{
    NSFetchRequest *fetch = [NSFetchRequest fetchRequestWithEntityName:@"VIDEOS"];
    NSSortDescriptor *sort = [[NSSortDescriptor alloc]
                              initWithKey:@"name_video" ascending:YES];
    [fetch setSortDescriptors:@[sort]];
    NSError *error;
    NSArray *array = [appDelegateIntance.managedObjectContext executeFetchRequest:fetch error:&error];
    return [NSMutableArray arrayWithArray:array];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if(firstTime){
        //deprecatedvideos
        //xtremv
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"NO!"
                                                            message:@"danger"
                                                           delegate:self
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:@"Play with AVplayer View Controller (deprecated)",
                                  @"Play AVPlayer library", nil];
        
        [alertView show];
        firstTime=NO;
    }else{
        firstTime=YES;
        if([[segue identifier] isEqualToString:@"xtremv"]){
            XtremVideosViewController *viewController = (XtremVideosViewController *)segue.destinationViewController;
            viewController.globalVideos = (VIDEOS *)selectedVideo;
        }
    }
}



@end
