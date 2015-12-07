//
//  SaveVideoTableViewController.m
//  AvPlayerIOSProject
//
//  Created by Fabian Rosales on 12/2/15.
//  Copyright © 2015 KeyBellSoftCR. All rights reserved.
//

#import "SaveVideoTableViewController.h"
#import "VIDEOS.h"
#import "AppDelegate.h"

@interface SaveVideoTableViewController ()
{
    AppDelegate *appDelegateIntance;
}
@end

@implementation SaveVideoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    appDelegateIntance = appDelegate;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(BOOL)validateForm{
    BOOL validate=true;
    
    if([self.textFieldName.text isEqualToString:@""])
    {
        validate=false;
    }
    
    if([self.textFieldURL.text isEqualToString:@""])
    {
        validate=false;
    }
    return validate;
}

- (IBAction)UIButtonSaveClick:(id)sender{
    if([self validateForm]){
        VIDEOS *videos = [NSEntityDescription insertNewObjectForEntityForName:@"VIDEOS" inManagedObjectContext:appDelegateIntance.managedObjectContext];
        
        [videos setValue:self.textFieldName.text forKey:@"name_video"];
        [videos setValue:self.textFieldURL.text forKey:@"url"];
        [appDelegateIntance saveContext];
        
        [self performSegueWithIdentifier:@"firstPage" sender:sender];
    }
    else{
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Please Review fields"
                                                          message:@"Please fill in the required fields"
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        
        [message show];
    }
}
@end
