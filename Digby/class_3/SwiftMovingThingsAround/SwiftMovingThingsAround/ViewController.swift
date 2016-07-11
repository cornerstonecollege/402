//
//  ViewController.swift
//  SwiftMovingThingsAround
//
//  Created by Digby Andrews on 2016-06-15.
//  Copyright © 2016 Digby Andrews. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var label:UILabel = UILabel()
    var isTouching = Bool()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.label.text = "My Beautiful Label"
        self.label.sizeToFit()
        self.label.center = self.view.center
        self.label.backgroundColor = UIColor.redColor()
        
        self.view.addSubview(self.label)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        let touch = touches.first!
        let location = touch.locationInView(self.view)
        self.isTouching = CGRectContainsPoint(self.label.frame, location);
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        if self.isTouching
        {
            let touch = touches.first!
            let location = touch.locationInView(self.view)
            
            self.label.center = location
        }
    }
}

