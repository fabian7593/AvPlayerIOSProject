//
//  XtremVideosViewController.m
//  AvPlayerIOSProject
//
//  Created by Fabian Rosales on 12/7/15.
//  Copyright © 2015 KeyBellSoftCR. All rights reserved.
//
#import <AVFoundation/AVFoundation.h>
#import "XtremVideosViewController.h"

@interface XtremVideosViewController ()
{
    NSURL *realUrl;
    AVPlayer *player;
    BOOL isStop;
    BOOL isFullScreen;
    CGRect oldFrame;
}

@end

@implementation XtremVideosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if(self.globalVideos!=nil){
    realUrl=[[NSURL alloc] initWithString:self.globalVideos.url];
    self.labelVideoTitle.text =self.globalVideos.name_video;
    player = [AVPlayer playerWithURL:realUrl];
    [self.playerView setPlayer:player];
    isStop=YES;
    isFullScreen = NO;
    self.buttonPlayStop.titleLabel.text=@"Play";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (IBAction)playStop:(id)sender {
    if(isStop){
       [player play];
        self.buttonPlayStop.titleLabel.text=@"Play";
        isStop=NO;
    }else{
       [player pause];
        self.buttonPlayStop.titleLabel.text=@"Pause";
        isStop=YES;
    }
}


- (IBAction)fullScreen:(id)sender {
    if (!isFullScreen) {
        oldFrame = self.playerView.frame;
        
        [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseIn
                         animations:^(void) {
                             CGRect frame = [[UIScreen mainScreen] bounds];
                             self.playerView.frame = frame;
                         }
                         completion:^(BOOL finished){
                             isFullScreen = YES;
                         }];
    }else {
        [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseIn
                         animations:^(void) {
                             self.playerView.frame = oldFrame;
                         }
                         completion:^(BOOL finished){
                             isFullScreen = NO;
                         }];
    }
}


@end
