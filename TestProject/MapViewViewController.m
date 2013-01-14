//
//  MapViewViewController.m
//  TestProject
//
//  Created by User on 1/14/13.
//  Copyright (c) 2013 Light. All rights reserved.
//

#import "MapViewViewController.h"
#import <MapKit/MapKit.h>

@interface MapViewViewController ()

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation MapViewViewController



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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setMapView:nil];
    [self setMapView:nil];
    [super viewDidUnload];
}
@end
