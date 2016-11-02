//
//  ViewController.swift
//  DebuggingAndViews
//
//  Created by Luiz on 2016-10-12.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createViews()
    }
    
    func createViews() {
//        let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
//        let label = UILabel(frame: rect)
//        label.backgroundColor = UIColor.red
//        label.text = "I'm a label"
//        label.center = self.view.center
//        self.view.addSubview(label)
        
        let label = UILabel()
        label.text = "I'm a label"
        label.sizeToFit() // the size will fit the text
        label.center = CGPoint(x: 50, y: 50)
        label.backgroundColor = UIColor.blue
        self.view.addSubview(label)
        
        let btnRect = CGRect(x: 100, y: 100, width: 100, height: 100)
        let button = UIButton(frame: btnRect)
        button.backgroundColor = UIColor.green
        // right way
        button.setTitle("I'm a button", for: UIControlState.normal)
        // wrong way
        //button.titleLabel?.text = "I'm a button"
        self.view.addSubview(button)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

