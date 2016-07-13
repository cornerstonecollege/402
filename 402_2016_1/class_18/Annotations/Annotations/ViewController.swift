//
//  ViewController.swift
//  Annotations
//
//  Created by CICCC1 on 2016-07-13.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let region = MKCoordinateRegionMake(CLLocationCoordinate2DMake(49.0, -123.0), MKCoordinateSpanMake(1, 1))
        self.mapView.setRegion(region, animated: true)
        self.mapView.userInteractionEnabled = true
        
        for _ in 1...10
        {
            let randLatN = arc4random_uniform(100) + 1
            let decimalLatRandN = 1.0/Double(randLatN)
            let latitude = 49.0 + decimalLatRandN
            
            let randLongN = arc4random_uniform(100) + 1
            let decimalLongRandN = 1.0/Double(randLongN)
            let longitude = -123.0 - decimalLongRandN
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2DMake(latitude, longitude)

            let geo = CLGeocoder()
            geo.reverseGeocodeLocation(CLLocation(latitude: latitude, longitude: longitude), completionHandler: { (placemarks: [CLPlacemark]?, error: NSError?) in
                annotation.title = placemarks?.first?.name
                self.mapView.addAnnotation(annotation)
            })
        }
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }


}

