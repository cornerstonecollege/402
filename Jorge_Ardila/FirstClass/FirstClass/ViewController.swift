//
//  ViewController.swift
//  FirstClass
//
//  Created by jorgelocal on 2016-10-11.
//  Copyright © 2016 jorgelocal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var num = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var Label: UILabel!
    
    @IBAction func ClickPlus(_ sender: AnyObject){
    
        
            self.Label.text = String(num + 1)
            num = num + 1
    
        
    }

}

