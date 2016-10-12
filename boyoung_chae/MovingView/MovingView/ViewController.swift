//
//  ViewController.swift
//  MovingView
//
//  Created by Boyoung on 2016-10-12.
//  Copyright © 2016 Boyoung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var myCustomView: UIView?   // optional view
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createView()
    }

    func createView() {
        let label = UILabel()
        label.text = "My Label"
        label.sizeToFit()
        label.backgroundColor = UIColor.cyan
        label.center = self.view.center
        self.myCustomView = label
        self.view.addSubview(label)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touches began")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.myCustomView != nil && touches.first != nil {
            
            self.myCustomView!.center = touches.first!.location(in: self.view)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touches ended")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }


}

