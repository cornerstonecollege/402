//
//  ViewController.m
//  MapAnnotations
//
//  Created by CICCC1 on 2016-07-13.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import "ViewController.h"
#import "MapKit/MapKit.h"

@interface ViewController () <CLLocationManagerDelegate>

@property (nonatomic) CLLocationManager *locationManager;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.locationManager = [CLLocationManager new];
    self.locationManager.delegate = self;
    
    if ([CLLocationManager authorizationStatus] != kCLAuthorizationStatusAuthorizedWhenInUse)
    {
        [self.locationManager requestWhenInUseAuthorization];
    }
    
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse)
    {
        [self.locationManager startUpdatingLocation];
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    CLLocation *location = [locations firstObject];
    
    MKCoordinateRegion region = MKCoordinateRegionMake(self.mapView.userLocation.coordinate, MKCoordinateSpanMake(0.05, 0.05));
    [self.mapView setRegion:region animated:YES];
    
    CLGeocoder *geo = [[CLGeocoder alloc]init];
    [geo reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error)
    {
        MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
        annotation.coordinate = location.coordinate;
        annotation.title = [placemarks firstObject].name;
        
        [self.mapView addAnnotation:annotation];
        
        NSLog(@"%@", location);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
