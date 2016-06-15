//
//  ViewController.swift
//  ExploringSwift2
//
//  Created by Dennis Pham on 2016-06-14.
//  Copyright © 2016 Dennis Pham. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var lblColor: UILabel!
    
    
    @IBAction func colorButton(sender: UIButton) {
        
        
        let redRand = arc4random_uniform(256);
        let greenRand = arc4random_uniform(256);
        let blueRand = arc4random_uniform(256);
        
        lblColor.text = "red \(String(format: "%x",redRand)) green \(String(format: "%x", greenRand)) blue \(String(format: "%x", blueRand))"
        
        let swiftColor = UIColor(red: CGFloat(redRand)/255.0, green:CGFloat(greenRand)/255.0, blue: CGFloat(blueRand)/255.0, alpha: 1.0)
        
        
        
        self.view.backgroundColor = swiftColor
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

   