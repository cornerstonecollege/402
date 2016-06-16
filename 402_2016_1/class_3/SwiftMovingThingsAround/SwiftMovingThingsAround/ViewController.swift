//
//  ViewController.swift
//  SwiftMovingThingsAround
//
//  Created by Dennis Pham on 2016-06-15.
//  Copyright © 2016 Dennis Pham. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var moveLabel = UILabel()
    //var labelTouched:UILabel? = nil
    var isTouching = Bool()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moveLabel.text = "My beautiful label";
        moveLabel.sizeToFit()
        moveLabel.center = view.center;
        moveLabel.backgroundColor = UIColor.redColor();
        
        view .addSubview(moveLabel)
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        let touch = touches.first!
        let location = touch.locationInView(self.view)
        
        isTouching = CGRectContainsPoint(self.moveLabel.frame, location)
        if self.isTouching {
            print("Swift Touching")
        }else{
         print("not Swift touching")
            
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if(isTouching)
        {
            let touch = touches.first!
            let location = touch.locationInView(self.view)
            moveLabel.center = location
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        isTouching = false;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

