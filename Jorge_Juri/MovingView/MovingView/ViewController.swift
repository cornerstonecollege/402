//
//  ViewController.swift
//  MovingView
//
//  Created by Luiz on 2016-10-12.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var myCustomView:UIView? // optional view
    var isDragging = false // flag

    override func viewDidLoad() {
        super.viewDidLoad()
        createView()
    }
    
    func createView () {
        let label = UILabel()
        label.text = "My Label"
        label.sizeToFit()
        label.backgroundColor = UIColor.cyan
        label.center = self.view.center
        self.myCustomView = label
        self.view.addSubview(label)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil && self.myCustomView != nil {
            let point = touches.first!.location(in: self.view)
            if self.myCustomView!.frame.contains(point) { // if the point is contained within the frame bounds
                self.isDragging = true
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.isDragging {
            if self.myCustomView != nil && touches.first != nil {
                self.myCustomView!.center = touches.first!.location(in: self.view)
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.isDragging = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

