//
//  ViewController.swift
//  FirstClass
//
//  Created by Boyoung on 2016-10-11.
//  Copyright © 2016 Boyoung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didClickChangeColor(_ sender: AnyObject) {
        let red = Float(arc4random_uniform(256)) / 255.0   // random 0 through 255
        let green = Float(arc4random_uniform(256)) / 255.0
        let blue = Float(arc4random_uniform(256)) / 255.0
        
        self.view.backgroundColor = UIColor(colorLiteralRed: red, green: green, blue: blue, alpha: 1.0)
    }

}

