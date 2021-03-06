//
//  ViewController.swift
//  CompassLocationAndCustomAnnotation
//
//  Created by Boyoung on 2016-11-08.
//  Copyright © 2016 Boyoung. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var lblLatitude: UILabel!
    @IBOutlet weak var lblLongitude: UILabel!
    
    @IBOutlet weak var lblX: UILabel!
    @IBOutlet weak var lblY: UILabel!
    @IBOutlet weak var lblZ: UILabel!
    
    // it needs to be global.
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Check if app is authorized and ask for permission if it is not.
        if CLLocationManager.authorizationStatus() != .authorizedWhenInUse {
            self.locationManager.requestWhenInUseAuthorization()
        }
            
        // Check again because we do not know if the user gave us authorization.
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            self.initVars()
        }
    }
    
    func initVars() {
        self.locationManager.delegate = self
        // for showing the compass view
        self.mapView.userTrackingMode = .followWithHeading
        self.locationManager.startUpdatingHeading() // compass
        self.locationManager.startUpdatingLocation()    // GPS
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.lblLatitude.text = (String("\(locations.first?.coordinate.latitude)"))!
        self.lblLongitude.text = (String("\(locations.first?.coordinate.longitude)"))!
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        self.lblX.text = String(newHeading.x)
        self.lblY.text = String(newHeading.y)
        self.lblZ.text = String(newHeading.z)
        
        print("The heading is \(newHeading.trueHeading)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }


}

