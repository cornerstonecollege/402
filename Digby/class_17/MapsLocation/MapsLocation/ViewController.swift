//
//  ViewController.swift
//  MapsLocation
//
//  Created by Digby Andrews on 2016-07-12.
//  Copyright © 2016 Digby Andrews. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate
{
    @IBOutlet weak var mapView: MKMapView!
    let locationHandler = CLLocationManager()
    
    override func viewDidLoad()
    {
        self.createLocation()
    }

    func createLocation ()
    {
        super.viewDidLoad()
        if CLLocationManager.authorizationStatus() !=
            CLAuthorizationStatus.AuthorizedWhenInUse
        {
            self.locationHandler.requestWhenInUseAuthorization()
        }
        
        if CLLocationManager.authorizationStatus() ==
            CLAuthorizationStatus.AuthorizedWhenInUse
        {
            self.locationHandler.delegate = self
            self.locationHandler.desiredAccuracy = kCLLocationAccuracyBest
            self.locationHandler.distanceFilter = 10
            self.locationHandler.startUpdatingLocation()
        }
        else
        {
            print("The user didn't allow")
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        if let location = locations.first
        {
            let span = MKCoordinateSpanMake(1, 1)
            
            let region = MKCoordinateRegionMake(location.coordinate, span)
            
            self.mapView.setRegion(region, animated: true)
        }
    }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }


}

