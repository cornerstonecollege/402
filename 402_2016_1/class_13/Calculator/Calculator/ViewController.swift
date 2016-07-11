//
//  ViewController.swift
//  Calculator
//
//  Created by CICCC1 on 2016-07-07.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtResut: UITextField!
    var number:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.txtResut.text = "\(self.number)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func btnClick(sender: UIButton)
    {
        let value = sender.titleLabel!.text!
        switch value {
        case "+": break
            
        case "-": break
        
        case "1":
            self.txtResult.text
        default:
            break
        }
    }


}

