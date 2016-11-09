//
//  ViewController.swift
//  DrinkingFountains
//
//  Created by Luiz on 2016-11-09.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    var json:NSDictionary?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let session = URLSession.shared
        let url = URL(string: "ftp://webftp.vancouver.ca/OpenData/json/drinking_fountains.json")
        let task = session.dataTask(with: url!) { (data, response, error) in
            
            if let err = error {
                print(err)
            }
            
            if data != nil {
                self.json = try! JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! NSDictionary
                // when we finished downloading the json:
                self.fillMap()
            } else {
                print("data is null")
            }
        }
        
        task.resume()
    }
    
    func fillMap() {
        let arrayDrinkingFountains = self.json?["features"] as! NSArray
        for fountain in arrayDrinkingFountains {
            let fountainDictionary = fountain as! NSDictionary
            
            let propertyDictionary = fountainDictionary["properties"] as! NSDictionary
            let name_title = propertyDictionary["NAME"] as! String
            let in_operation = propertyDictionary["IN_OPERATION"] as? String
            let location = propertyDictionary["LOCATION"] as? String
            let subtitle = "\(location): \(in_operation)"
            
            let geometryDictionary = fountainDictionary["geometry"] as! NSDictionary
            let coordinatesArr = geometryDictionary["coordinates"] as! [Double]
            
            let lat = 49.284789 + (Double(arc4random_uniform(100)) / 100.0)
            let lon = -123.113677 + Double(arc4random_uniform(100)) / 100.0
            
            let coord = CLLocationCoordinate2DMake(lat, lon)
            let annotation = MKPointAnnotation()
            annotation.coordinate = coord
            annotation.title = name_title
            annotation.subtitle = subtitle
            
            self.mapView.addAnnotation(annotation)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

