//
//  ViewController.swift
//  Views Swift
//
//  Created by CICCC1 on 2016-06-20.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let myFrame = CGRect(x: 0, y: 0, width: 100, height: 100);
        let speechBubble = SpeechBubble(frame: myFrame)
        speechBubble.center = self.view.center
        self.view.addSubview(speechBubble)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
}

