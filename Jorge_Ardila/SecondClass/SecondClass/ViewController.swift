//
//  ViewController.swift
//  SecondClass
//
//  Created by jorgelocal on 2016-10-12.
//  Copyright © 2016 jorgelocal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createViews()
        texForLabel()
        button()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func createViews() {
        
        let rect = CGRect(x:0, y:0, width:100, height:100)
        let label = UILabel(frame: rect)
        label.backgroundColor = UIColor.red
        label.center = self.view.center
        label.text = "PIROBO"
        self.view.addSubview(label)
    }
    
    func texForLabel(){
        
        let label2 = UILabel()
        label2.text = "La concha de la lora"
        label2.sizeToFit()
        label2.center = CGPoint(x:50, y:50)
        label2.backgroundColor = UIColor.green
        self.view.addSubview(label2)
    }
    
    func button()
    {
        let btnRect = CGRect(x:100, y:100, width:100, height:100)
        let button = UIButton(frame: btnRect)
        button.backgroundColor = UIColor.blue
        
        // correct way to call the button cuz it needs to be more specific 
        button.setTitle("I am a button", for:UIControlState.normal)
        
        //wrong way to call the button
        self.view.addSubview(button)
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

