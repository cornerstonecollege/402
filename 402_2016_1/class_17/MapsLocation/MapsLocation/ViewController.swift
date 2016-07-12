//
//  ViewController.swift
//  MapsLocation
//
//  Created by CICCC1 on 2016-07-12.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    let locationHandler = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createLocation()
    }

    func createLocation()
    {
        if CLLocationManager.authorizationStatus() != CLAuthorizationStatus.AuthorizedWhenInUse
        {
            self.locationHandler.requestWhenInUseAuthorization();
        }
        
        if CLLocationManager.authorizationStatus() == CLAuthorizationStatus.AuthorizedWhenInUse
        {
            self.locationHandler.delegate = self
            self.locationHandler.desiredAccuracy = kCLLocationAccuracyBest
            self.locationHandler.distanceFilter = 10
            self.locationHandler.startUpdatingLocation()
            self.locationHandler.startUpdatingHeading()
            self.mapView.setUserTrackingMode(MKUserTrackingMode.FollowWithHeading, animated: true)
            let span = MKCoordinateSpanMake(1, 1)
            let region = MKCoordinateRegionMake(self.mapView.userLocation.coordinate, span)
            self.mapView.setRegion(region, animated: true)
        }
        else
        {
            print("The user did not allowed it.");
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        print("\(newLocation)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

