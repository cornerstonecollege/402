//
//  ViewController.swift
//  Maps
//
//  Created by Boyoung on 2016-11-07.
//  Copyright © 2016 Boyoung. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

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
        
            self.locationManager.startUpdatingLocation()
            self.locationManager.startUpdatingHeading()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

