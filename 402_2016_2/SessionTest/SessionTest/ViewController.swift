//
//  ViewController.swift
//  SessionTest
//
//  Created by Luiz on 2016-10-24.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var json:NSArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let session = URLSession.shared
        let url = URL(string: "http://api.ideiadoluiz.com.br/402/")
        let task = session.dataTask(with: url!) { (data, response, error) in
            
            if let err = error {
                print(err)
            }
            
            if data != nil {
                self.json = try! JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! NSArray
            } else {
                print("data is null")
            }
        }
        
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

