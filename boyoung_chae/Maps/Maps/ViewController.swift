//
//  ViewController.swift
//  Maps
//
//  Created by Boyoung on 2016-11-07.
//  Copyright © 2016 Boyoung. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Check if app is authorized and ask for permission if it is not.
        if CLLocationManager.authorizationStatus() != .authorizedWhenInUse {
            
            self.locationManager.requestWhenInUseAuthorization()
        }
        
        // Check again because we do not know if the user gave us authorization.
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
        
            self.mapView.delegate = self
            self.locationManager.startUpdatingLocation()
            self.locationManager.startUpdatingHeading()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let region = MKCoordinateRegionMake((locations.first?.coordinate)!, MKCoordinateSpanMake(1, 1))
        self.mapView.setRegion(region, animated: true)
        
        for location in locations {
            
            let x = Double(arc4random_uniform(1000)) / 1000.0
            let y = Double(arc4random_uniform(1000)) / 1000.0
        
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2DMake(location.coordinate.latitude + x, location.coordinate.longitude + y)
            
//            annotation.coordinate = CLLocationCoordinate2DMake(35.250841, -101.8844095)
            
            self.mapView.addAnnotation(annotation)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

