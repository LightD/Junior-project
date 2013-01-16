//
//  ManagedDocumentSingleton.m
//  TestProject
//
//  Created by User on 1/16/13.
//  Copyright (c) 2013 Light. All rights reserved.
//

#import "ManagedDocumentSingleton.h"

@interface ManagedDocumentSingleton ()

@property (nonatomic,strong)  UIManagedDocument* managedDocument;

@end


@implementation ManagedDocumentSingleton

@synthesize managedDocument = _managedDocument;

-(void)setupFetchedResultsController
{
    
}

-(void)useDocument
{
    if(![[NSFileManager defaultManager] fileExistsAtPath:[self.managedDocument.fileURL path]]){
        [self.managedDocument saveToURL:self.managedDocument.fileURL forSaveOperation:UIDocumentSaveForCreating completionHandler:^(BOOL success){
            [self setupFetchedResultsController];
        }];
    } else if (self.managedDocument.documentState == UIDocumentStateClosed){
        [self.managedDocument openWithCompletionHandler:^(BOOL success) {
            [self setupFetchedResultsController];
        }];
    } else if (self.managedDocument.documentState == UIDocumentStateNormal){
            [self setupFetchedResultsController];
    }
}

-(void)setManagedDocument:(UIManagedDocument *)managedDocument
{
    if(managedDocument != _managedDocument){
        _managedDocument = managedDocument;
        [self useDocument];
    }
}

-(UIManagedDocument *)managedDocument
{
    
    if(!self.managedDocument){
        // initialize the shared document instance..
        NSURL *url = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
        url = [url URLByAppendingPathComponent:@"Locations Database"];
        self.managedDocument = [[UIManagedDocument alloc] initWithFileURL:url];
    }
    return self.managedDocument;
}

-(void) light
{
    
}

@end
