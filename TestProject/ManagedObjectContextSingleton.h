//
//  ManagedObjectContextSingleton.h
//  TestProject
//
//  Created by User on 1/15/13.
//  Copyright (c) 2013 Light. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface ManagedObjectContextSingleton : NSManagedObjectContext

+(ManagedObjectContextSingleton *) managedObjectContextObject;

- (NSURL *)applicationDocumentsDirectory;

@end
