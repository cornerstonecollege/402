//
//  ViewController.swift
//  CustomViewMaps
//
//  Created by Luiz on 2016-11-08.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vancouverCoordinate = CLLocationCoordinate2D(latitude: 49.2827, longitude: -123.1207)
        self.mapView.setRegion(MKCoordinateRegionMake(vancouverCoordinate, MKCoordinateSpanMake(1, 1)), animated: true)
        self.mapView.delegate = self
        
//        let annotation = MKPointAnnotation()
//        annotation.coordinate = vancouverCoordinate
//        annotation.title = "City of Vancouver"
//        annotation.subtitle = "Hello all."
        let annotation = CustomAnnotation(coordinate: vancouverCoordinate)
        annotation.title = "Custom annotation title"
        annotation.subtitle = "Custom annotation subtitle"
        
        self.mapView.addAnnotation(annotation)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is CustomAnnotation {
            let annotationView = CustomAnnotationView(annotation: annotation, reuseIdentifier: "customIdentifier")
            return annotationView
        }
        
        return nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

