//
//  ManagedObjectContextSingleton.m
//  TestProject
//
//  Created by User on 1/15/13.
//  Copyright (c) 2013 Light. All rights reserved.
//

#import "ManagedObjectContextSingleton.h"
#import <CoreData/CoreData.h>

@interface ManagedObjectContextSingleton ()

@property (readonly, strong, nonatomic) ManagedObjectContextSingleton *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@end

@implementation ManagedObjectContextSingleton

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

+ (ManagedObjectContextSingleton *)managedObjectContextObject
{
    static ManagedObjectContextSingleton *sharedSingleton;
    
    @synchronized(self)
    {
        if (!sharedSingleton){
            ManagedObjectContextSingleton *managedObjectContext = [[ManagedObjectContextSingleton alloc] init];
            sharedSingleton = [managedObjectContext managedObjectContext];
//            NSString *STORE_TYPE = NSSQLiteStoreType;
//            NSString *STORE_FILENAME = @"CDCLI.cdcli";
//            
//            NSError *error;
//            NSURL *url = [applicationLogDirectory() URLByAppendingPathComponent:STORE_FILENAME];
//            
//            NSPersistentStore *newStore = [coordinator addPersistentStoreWithType:STORE_TYPE
//                                                                    configuration:nil
//                                                                              URL:url
//                                                                          options:nil
//                                                                            error:&error];
//            
//            if (newStore == nil) {
//                NSLog(@"Store Configuration Failure\n%@",
//                      ([error localizedDescription] != nil) ?
//                      [error localizedDescription] : @"Unknown Error");
//            }
//        
        }
        return sharedSingleton;
    }
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[ManagedObjectContextSingleton alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSBundle * bundle = [NSBundle mainBundle];
    NSURL *modelURL = [bundle URLForResource:@"Reminders" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"TestProject.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES}
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
