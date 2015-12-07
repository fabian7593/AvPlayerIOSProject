//
//  PlayerClass.m
//  AvPlayerIOSProject
//
//  Created by Fabian Rosales on 12/7/15.
//  Copyright © 2015 KeyBellSoftCR. All rights reserved.
//

#import "PlayerClass.h"

@implementation PlayerClass

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

+ (Class)layerClass {
    return [AVPlayerLayer class];
}
- (AVPlayer*)player {
    return [(AVPlayerLayer *)[self layer] player];
}
- (void)setPlayer:(AVPlayer *)player {
    [(AVPlayerLayer *)[self layer] setPlayer:player];
}

@end
