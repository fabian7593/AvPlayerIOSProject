//
//  ViewController.m
//  AvPlayerIOSProject
//
//  Created by Fabian Rosales on 11/26/15.
//  Copyright © 2015 KeyBellSoftCR. All rights reserved.
//

#import "VideoViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import "principalTableViewController.h"
@import AVFoundation;
@import AVKit;

@interface VideoViewController ()
{
    AVPlayerViewController *playerViewController;
    NSURL *realUrl;
}
@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


-(void)viewDidAppear:(BOOL)animated
{
    realUrl=[[NSURL alloc] initWithString:self.globalVideos.url];
    AVPlayerItem *realItem = [AVPlayerItem playerItemWithURL: realUrl];
    [realItem addObserver:self forKeyPath:@"status" options:0 context:&realItem];
    
    AVQueuePlayer *player = [AVQueuePlayer queuePlayerWithItems:[NSArray arrayWithObjects:realItem, nil]];
    playerViewController = [[AVPlayerViewController alloc] init];
    playerViewController.player=player;
    [self presentViewController:playerViewController animated:NO completion:^{}];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.titleLabel.text = @"Back";
    btn.frame = CGRectMake(50, 50, 5, 5);
    [btn addTarget:self action:@selector(didSelectButton:) forControlEvents:UIControlEventTouchUpInside];
    [btn setUserInteractionEnabled:YES];
    [btn setEnabled:YES];
    [playerViewController.contentOverlayView addSubview:btn];

    
    [player play];
    
    
    
   /*
    AVPlayerViewController *playerView = [[AVPlayerViewController alloc] init];
    playerView.player = [AVPlayer playerWithURL:realUrl];
        CGRect viewInsetRect = CGRectInset ([self.view bounds],
                                        50,
                                        0 );
    [[playerView view] setFrame:viewInsetRect];
    [self.view addSubview: [playerView view]];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.titleLabel.text = @"Back";
    btn.frame = CGRectMake(50, 50, 5, 5);
    [btn addTarget:self action:@selector(didSelectButton:) forControlEvents:UIControlEventTouchUpInside];
    [btn setUserInteractionEnabled:YES];
    [btn setEnabled:YES];
    
    [playerView.contentOverlayView addSubview:btn];
    [playerView.player play];
    */
    
}

- (IBAction) didSelectButton:(id)sender {
    principalTableViewController *viewController = [[principalTableViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}




- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object
                        change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"status"]) {
        AVPlayerItem *pItem = (AVPlayerItem *)object;
        if (pItem.status == AVPlayerItemStatusReadyToPlay) {
            [playerViewController.player play];
        }
     
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
