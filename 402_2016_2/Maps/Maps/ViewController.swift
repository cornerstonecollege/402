//
//  ViewController.swift
//  Maps
//
//  Created by Luiz on 2016-11-07.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // check if app is authorized and ask for permission if it is not.
        if CLLocationManager.authorizationStatus() != .authorizedWhenInUse {
            self.locationManager.requestWhenInUseAuthorization()
        }
        
        // check again because we do not know if the user gave us authorization
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            self.locationManager.delegate = self
            self.mapView.delegate = self
            self.locationManager.startUpdatingLocation()
            self.locationManager.startUpdatingHeading()
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is CustomAnnotation {
            let view = AnnotationView(annotation: annotation, reuseIdentifier: "dsds")
            return view
        }
        
        return nil
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let region = MKCoordinateRegionMake((locations.first?.coordinate)!, MKCoordinateSpanMake(1, 1))
        self.mapView.setRegion(region, animated: true)
        
        for location in locations {
            let x = Double(arc4random_uniform(1000)) / 1000.0
            let y = Double(arc4random_uniform(1000)) / 1000.0
            
            let annotation = CustomAnnotation()
            annotation.coordinate = CLLocationCoordinate2DMake(location.coordinate.latitude + x, location.coordinate.longitude + y)
            //annotation.coordinate = CLLocationCoordinate2DMake(49.284789, -123.113677)
            self.mapView.addAnnotation(annotation)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

