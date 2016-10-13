//
//  ViewController.swift
//  FirstClass_Count
//
//  Created by Boyoung on 2016-10-11.
//  Copyright © 2016 Boyoung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var CountNumber: UILabel!
    
    @IBAction func didClickCountNumber(_ sender: AnyObject) {

        count = count + 1
        
        self.CountNumber.text = count.description
    }

}

