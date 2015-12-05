//
//  VIDEOS+CoreDataProperties.h
//  AvPlayerIOSProject
//
//  Created by Cesar Gomez on 12/2/15.
//  Copyright © 2015 KeyBellSoftCR. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "VIDEOS.h"

NS_ASSUME_NONNULL_BEGIN

@interface VIDEOS (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name_video;
@property (nullable, nonatomic, retain) NSString *url;

@end

NS_ASSUME_NONNULL_END
