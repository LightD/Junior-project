//
//  Location.h
//  TestProject
//
//  Created by User on 1/16/13.
//  Copyright (c) 2013 Light. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Location : NSManagedObject

@property (nonatomic, retain) NSNumber * latitude;
@property (nonatomic, retain) NSNumber * longitude;
@property (nonatomic, retain) NSString * name;

@end
