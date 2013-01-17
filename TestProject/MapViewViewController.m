//
//  MapViewViewController.m
//  TestProject
//
//  Created by User on 1/14/13.
//  Copyright (c) 2013 Light. All rights reserved.
//

#import "MapViewViewController.h"


@interface MapViewViewController ()

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation MapViewViewController

@synthesize mapView, annotations = _annotations, geoCoder = _geoCoder, locationManager = _locationManager;

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
    
    if ([CLLocationManager locationServicesEnabled]) {
        // Create a location manager.
        self.geoCoder = [[CLGeocoder alloc] init];
        self.locationManager = [[CLLocationManager alloc] init];
        // Set ourselves as it's delegate so that we get
        // notified of position updates.
        self.locationManager.delegate = self;
        // Set the desired accuracy.
        self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
        // Start tracking.
        [self.locationManager startUpdatingLocation];
    }
    UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc]
                                          initWithTarget:self action:@selector(handleLongPress:)];
    NSLog(@"create gesture recognizer");
    lpgr.minimumPressDuration = 1.0; //user needs to press for 2 seconds
    [self.mapView addGestureRecognizer:lpgr];
    NSLog(@"added the gesture recognizer to the map");
    
}

// call this function when you get a location to drop the pin and give it an address
-(void)dropPinAnnotationWithPlacemard:(CLPlacemark *)placemark
{
    // create an annotation and intialize it with the passed location
    MKPointAnnotation * annot = [[MKPointAnnotation alloc] init];
    annot.coordinate = placemark.location.coordinate;
    
    // get the name of the location 
    NSString *locatedAt = [[placemark.addressDictionary valueForKey:@"FormattedAddressLines"] componentsJoinedByString:@", "];

    
    // create a location and initialize it with the proper data
    Location *location = [[Location alloc] init];
    location.latitude = [[NSNumber alloc] initWithDouble:annot.coordinate.latitude];
    location.latitude = [[NSNumber alloc] initWithDouble:annot.coordinate.latitude];
    location.name = locatedAt;
    
    // save to database.. 
    
 
    
    [self.mapView addAnnotation:annot];
    NSLog(@"longitude = %f ",annot.coordinate.longitude);
    NSLog(@"latitude = %f",annot.coordinate.longitude);
    
}

- (void)handleLongPress:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state != UIGestureRecognizerStateBegan){
        NSLog(@"not long press gesture recognizer");
        return;
    }
    
    // get the touch point ( where the user pressed on the map view )
    CGPoint touchPoint = [gestureRecognizer locationInView:self.mapView];
    
    // convert the point from a view base to real map points
    CLLocationCoordinate2D touchMapCoordinate = [self.mapView convertPoint:touchPoint
                                                      toCoordinateFromView:self.mapView];
    
    // declare a place mark that will be used inside the thread of geoCoder
    __block CLPlacemark *placemark;
    
    // inizialize CLLocation object to hold the location and pass it to geoCoder
    CLLocation *location = [[CLLocation alloc] initWithLatitude:touchMapCoordinate.latitude longitude:touchMapCoordinate.longitude];
    
    // reverGeocode the location and fun on a thread
    [self.geoCoder reverseGeocodeLocation:location completionHandler:
     
     ^(NSArray *placemarks, NSError *error) {
         //Get nearby address
         placemark = [placemarks objectAtIndex:0];
         
         [self dropPinAnnotationWithPlacemard:placemark];
     }];
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
    [super viewDidUnload];
}

@end
