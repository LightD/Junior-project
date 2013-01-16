//
//  MapViewViewController.h
//  TestProject
//
//  Created by User on 1/14/13.
//  Copyright (c) 2013 Light. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ManagedObjectContextSingleton.h"
#import "Location.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreData/CoreData.h>

@interface MapViewViewController : UIViewController

@property (nonatomic,strong) NSArray *annotations;


- (void)handleLongPress:(UIGestureRecognizer *)gestureRecognizer;

@end
