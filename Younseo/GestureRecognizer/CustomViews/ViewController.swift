//
//  ViewController.swift
//  CustomViews
//
//  Created by hoconey on 2016/10/13.
//  Copyright © 2016年 younseo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let frame = CGRect(x: 0, y: 50, width: 100, height: 100)
        let circle = FirstCustomView(frame: frame)
        //circle.backgroundColor = UIColor.red
        self.view.addSubview(circle)
        
        let frame2 = CGRect(x: 200, y: 50, width: 100, height: 100)
        let circle2 = FirstCustomView(frame: frame2)
        //circle.backgroundColor = UIColor.red
        self.view.addSubview(circle2)
        
        let frame3 = CGRect(x: 100, y: 250, width: 100, height: 200)
        let circle3 = FirstCustomView(frame: frame3)
        //circle.backgroundColor = UIColor.red
        self.view.addSubview(circle3)
        
        let circleFrame = CGRect(x: 100, y: 100, width: 100, height: 100)
        let circle4 = CircleView(frame: circleFrame)
        //circle4.backgroundColor = UIColor.yellow
        self.view.addSubview(circle4)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func panGesture(_ pan: UIPanGestureRecognizer){
        pan.view!.center = pan.location(in: self.view)
    }
    



}

