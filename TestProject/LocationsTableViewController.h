//
//  LocationsTableViewController.h
//  TestProject
//
//  Created by User on 1/11/13.
//  Copyright (c) 2013 Light. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataTableViewController.h"
#import "Location.h"

@interface LocationsTableViewController : CoreDataTableViewController

@property (nonatomic,strong) UIManagedDocument * managedDocument;

@end
