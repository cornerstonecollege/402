//
//  ViewController.m
//  AnnotationsReview
//
//  Created by Digby Andrews on 2016-07-14.
//  Copyright © 2016 Digby Andrews. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self buildMap];
}

- (void) buildMap
{
    CLLocation *location = [[CLLocation alloc]initWithLatitude:49.0 longitude:-123.0];
    [self buildAnnotationsWithCoordinate:location.coordinate];
    MKCoordinateRegion region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(1, 1));
    [self.mapView setRegion:region animated:YES];
}

- (void) buildAnnotationsWithCoordinate:(CLLocationCoordinate2D)coordinate
{
    for (int i = 0; i < 10; i++)
    {
        NSUInteger randLat = arc4random_uniform(10) + 1;
        CGFloat randDecLat = 1.0/randLat;
        
        NSUInteger randLong = arc4random_uniform(10) + 1;
        CGFloat randDecLong = 1.0/randLong;
        
        CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(coordinate.latitude + randDecLat, coordinate.longitude + randDecLong);
        
        MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
        annotation.coordinate = coord;
        
        CLLocation *myLocation = [[CLLocation alloc]initWithLatitude:coord.latitude longitude:coord.longitude];
        
        CLGeocoder *geo = [CLGeocoder new];
        [geo reverseGeocodeLocation:myLocation completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error)
        {
            annotation.title = [placemarks firstObject].name;
            [self.mapView addAnnotation:annotation];
        }];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
