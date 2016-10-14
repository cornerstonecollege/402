//
//  ViewController.swift
//  CustomViews
//
//  Created by Luiz on 2016-10-13.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let frame = CGRect(x: 0, y: 50, width: 100, height: 100)
        let view1 = FirstCustomView(frame: frame)
        self.view.addSubview(view1)
        
        let frame2 = CGRect(x: 200, y: 50, width: 100, height: 100)
        let view2 = FirstCustomView(frame: frame2)
        self.view.addSubview(view2)
        
        let frame3 = CGRect(x: 0, y: 0, width: 200, height: 250)
        let view3 = FirstCustomView(frame: frame3)
        view3.center = self.view.center
        self.view.addSubview(view3)
        
        let circleFrame = CGRect(x: 100, y: 100, width: 100, height: 100)
        let circle = CircleView(frame: circleFrame)
        //circle.backgroundColor = UIColor.yellow
        self.view.addSubview(circle)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

