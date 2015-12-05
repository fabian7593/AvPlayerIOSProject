//
//  SaveVideoTableViewController.h
//  AvPlayerIOSProject
//
//  Created by Cesar Gomez on 12/2/15.
//  Copyright © 2015 KeyBellSoftCR. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SaveVideoTableViewController : UITableViewController

@property(nonatomic,strong) IBOutlet UITextField *textFieldName;
@property(nonatomic,strong) IBOutlet UITextField *textFieldURL;
- (IBAction)UIButtonSaveClick:(id)sender;
@end
