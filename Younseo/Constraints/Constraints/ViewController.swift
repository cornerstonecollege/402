//
//  ViewController.swift
//  Constraints
//
//  Created by hoconey on 2016/10/17.
//  Copyright © 2016年 younseo. All rights reserved.
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

    @IBAction func pinchRecognizer(_ sender: AnyObject) {
        print("It was pinched")
    }

}

