//
//  ViewController.swift
//  DrinkingFountains
//
//  Created by Boyoung on 2016-11-09.
//  Copyright © 2016 Boyoung. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var json: NSDictionary?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mapView.delegate = self
        let latitude = 49.284789
        let longitude = -123.113677
        
        let coord = CLLocationCoordinate2DMake(latitude, longitude)
        self.mapView.setRegion(MKCoordinateRegionMake(coord, MKCoordinateSpanMake(1, 1)), animated: true)
        
        let session = URLSession.shared
        let url = URL(string: "ftp://webftp.vancouver.ca/OpenData/json/drinking_fountains.json")
        let task = session.dataTask(with: url!) { (data, response, error) in
            
            if let err = error {
                print(err)
            }
            
            if data != nil {
                self.json = try! JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! NSDictionary
                
                // When we finished downloading the json
                self.fillMap()
            } else {
                print("data is null")
            }
        }
        
        task.resume()
    }

    func fillMap() {
        DispatchQueue.main.async(execute: {
            let arrayDrinkingFountains = self.json?["features"] as! NSArray
            
            for fountain in arrayDrinkingFountains {
                let fountainDictionary = fountain as! NSDictionary
                
                let propertiesDictionary = fountainDictionary["properties"] as! NSDictionary
                let name_title = propertiesDictionary["NAME"] as! String
                let in_operation = propertiesDictionary["IN_OPERATION"] as? String
                let location = propertiesDictionary["LOCATION"] as? String
                let subTitle = "\(location) \(in_operation)"
                
    //            let geometryDictionary = fountainDictionary["geometry"] as! NSDictionary
    //            let coordinatesArray = geometryDictionary["coordinates"] as! [Double]

                let latitude = 49.284789 + (Double(arc4random_uniform(100)) / 100.0)
                let longitude = -123.113677 + (Double(arc4random_uniform(100)) / 100.0)
                
                let coord = CLLocationCoordinate2DMake(latitude, longitude)

                let annotation = CustomAnnotation(coordinate: coord)
    //            annotation.coordinate = coord
                annotation.title = name_title
                annotation.subtitle = subTitle
                
                self.mapView.addAnnotation(annotation)
            }
            
            //self.mapView.showAnnotations(self.mapView.annotations, animated: true)
        })
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

