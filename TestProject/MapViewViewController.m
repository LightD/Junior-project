//
//  MapViewViewController.m
//  TestProject
//
//  Created by User on 1/14/13.
//  Copyright (c) 2013 Light. All rights reserved.
//

#import "MapViewViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MapViewViewController ()

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation MapViewViewController

@synthesize mapView, annotations = _annotations;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    if(![CLLocationManager locationServicesEnabled])
    {
        // prompt the user to enable the location services
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Location Services Disabled !"
                                                        message:@"please enable the location services to allow us to remind you properly."
                              
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        
    }
    
    UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc]
                                          initWithTarget:self action:@selector(handleLongPress:)];
    NSLog(@"create gesture recognizer");
    lpgr.minimumPressDuration = 2.0; //user needs to press for 2 seconds
    [self.mapView addGestureRecognizer:lpgr];
    NSLog(@"added the gesture recognizer to the map");
    
}

- (void)handleLongPress:(UIGestureRecognizer *)gestureRecognizer
{
    
    NSLog(@"inside gesture recognizer");
    if (gestureRecognizer.state != UIGestureRecognizerStateBegan){
        NSLog(@"not long press gesture recognizer");
        return;
    }
    
    CGPoint touchPoint = [gestureRecognizer locationInView:self.mapView];
    CLLocationCoordinate2D touchMapCoordinate =
    [self.mapView convertPoint:touchPoint toCoordinateFromView:self.mapView];
    MKPointAnnotation * annot = [[MKPointAnnotation alloc] init];
    annot.coordinate = touchMapCoordinate;
    [self.mapView addAnnotation:annot];
    // add the annotation to the Core Location corresponding table
    
 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}

- (void)viewDidUnload {
    [self setMapView:nil];
    [self setMapView:nil];
    [super viewDidUnload];
}

@end
