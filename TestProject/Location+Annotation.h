//
//  Location+Annotation.h
//  TestProject
//
//  Created by User on 1/15/13.
//  Copyright (c) 2013 Light. All rights reserved.
//

#import "Location.h"

@interface Location (Annotation)

+(Location *) locationWithAnnotaion:(NSDictionary *)annotationInfo	inManagedObjectContext:(NSManagedObjectContext * )managedObjectContext;

@end
