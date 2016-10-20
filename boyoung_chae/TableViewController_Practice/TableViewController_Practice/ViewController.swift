//
//  ViewController.swift
//  TableViewController_Practice
//
//  Created by Boyoung on 2016-10-19.
//  Copyright © 2016 Boyoung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
       
        if let addressbook = NameAddressTableViewController.selected {
        
            let detailed = addressbook["name"]! + " / " + addressbook["address"]!
            self.label.text = detailed
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    

}

