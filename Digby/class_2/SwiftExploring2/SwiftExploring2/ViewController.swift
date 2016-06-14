//
//  ViewController.swift
//  SwiftExploring2
//
//  Created by Digby Andrews on 2016-06-14.
//  Copyright © 2016 Digby Andrews. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblColor: UILabel!
    @IBOutlet weak var hexLabel: UILabel!
    
    @IBAction func colorBtnClicked(sender: AnyObject)
        
    {
        let randRed = arc4random_uniform(255)
        let randGreen = arc4random_uniform(255)
        let randBlue = arc4random_uniform(255)
        
        lblColor.text = "Red:\(randRed) Green:\(randGreen) Blue:\(randBlue)"
        hexLabel.text = "#\(String(format: "%x", randRed))\(String(format:"%x", randGreen))\(String(format:"%x",randBlue))"
        
        let swiftColor = UIColor(red:CGFloat(randRed)/255.0, green: CGFloat(randGreen)/255.0, blue: CGFloat(randBlue)/255.0, alpha: 1.0)
        
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

