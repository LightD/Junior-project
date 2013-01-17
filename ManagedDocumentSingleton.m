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
static UIManagedDocument *sharedManagedDocument;

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
    if(_managedDocument != managedDocument){
        _managedDocument = managedDocument;
        [self useDocument];
    }
}

+(UIManagedDocument *)managedDocument
{
    
    if(!sharedManagedDocument){
        // initialize the shared document instance..
        ManagedDocumentSingleton *managedDocumentInstance;
        NSURL *url = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
        url = [url URLByAppendingPathComponent:@"Locations Database"];
        [managedDocumentInstance setManagedDocument: [[UIManagedDocument alloc] initWithFileURL:url]];
        sharedManagedDocument = managedDocumentInstance;
    }
    return sharedManagedDocument;
}

@end
