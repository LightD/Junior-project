//
//  Reminder.h
//  TestProject
//
//  Created by User on 1/16/13.
//  Copyright (c) 2013 Light. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Location;

@interface Reminder : NSManagedObject

@property (nonatomic, retain) NSString * image;
@property (nonatomic, retain) NSNumber * reminderDescription;
@property (nonatomic, retain) NSNumber * snooze;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) Location *atLocation;

@end
