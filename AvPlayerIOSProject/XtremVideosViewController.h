//
//  XtremVideosViewController.h
//  AvPlayerIOSProject
//
//  Created by Fabian Rosales on 12/7/15.
//  Copyright © 2015 KeyBellSoftCR. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VIDEOS.h"
#import "PlayerClass.h"

@interface XtremVideosViewController : UIViewController
@property (weak, nonatomic) IBOutlet PlayerClass *playerView;

@property (weak, nonatomic) IBOutlet UIButton *buttonPlayStop;
@property (weak, nonatomic) IBOutlet UIButton *buttonFullScreen;
@property (weak, nonatomic) IBOutlet UILabel *labelVideoTitle;

@property(nonatomic,strong) VIDEOS *globalVideos;

@end
