//
//  ViewController.swift
//  myLabel
//
//  Created by jjuri2 on 2016-10-12.
//  Copyright © 2016 jjuri2. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel()
        
        label.text = "aaaaaa"
        label.sizeToFit()
        label.center = CGPoint(x:150 , y:150)
        label.backgroundColor=UIColor.blue
        self.view.addSubview(label)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

