//
//  ViewController.swift
//  SwiftViews
//
//  Created by Digby Andrews on 2016-06-20.
//  Copyright © 2016 Digby Andrews. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let myFrame = CGRect(x: 0, y: 0, width: 100, height: 100)
        let speechBubble = SwiftSpeechBubble(frame: myFrame)
        //speechBubble.backgroundColor = UIColor.redColor()
        self.view.addSubview(speechBubble)
        speechBubble.center = view.center
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }


}

