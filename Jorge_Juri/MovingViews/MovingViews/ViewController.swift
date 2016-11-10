//
//  ViewController.swift
//  MovingViews
//
//  Created by jjuri2 on 2016-10-12.
//  Copyright © 2016 jjuri2. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {

    var myCustomView: UIView? // is a optional
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createView()
    }

    func createView() {
    

        let label = UILabel()
        label.text = "prueba"
        label.sizeToFit()
        label.backgroundColor = UIColor.cyan
        label.center = self.view.center
        self.myCustomView  = label
        self.view.addSubview(label)
        
        
    
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touches move")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
       
        guard let touch = touches.first else { return }
        
        let location = touch.location(in: self.view)
        
        activeSlicePoints.append(location)
        redrawActiveSlice()
        
        /*if self.myCustomView != nil && touches.first != nil {
        self.myCustomView!.center = touches.first!.location(in: self.view)
        }*/
        
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
               print("touches fin ")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

