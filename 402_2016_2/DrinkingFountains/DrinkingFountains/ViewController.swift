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
    
    var json:NSArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let session = URLSession.shared
        let url = URL(string: "http://192.168.11.212:8888/test/index.php")
        var request = URLRequest(url: url!)
        request.httpMethod = "DELETE"
        //request.httpBody = "name=test1".data(using: .utf8)
        request.setValue("luiz", forHTTPHeaderField: "NAME")
        //request
        let task = session.dataTask(with: request) { (data, response, error) in
            
            if let err = error {
                print(err)
            }
            
            if data != nil {
                self.json = try! JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! NSArray
                // when we finished downloading the json:
                self.fillMap()
            } else {
                print("data is null")
            }
        }
        
        task.resume()
    }
    
    func fillMap() {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

