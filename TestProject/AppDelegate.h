//
//  AppDelegate.h
//  TestProject
//
//  Created by User on 1/9/13.
//  Copyright (c) 2013 Light. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ManagedObjectContextSingleton.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (void)saveContext;

@end
