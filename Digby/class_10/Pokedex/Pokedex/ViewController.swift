//
//  ViewController.swift
//  Pokedex
//
//  Created by Digby Andrews on 2016-07-08.
//  Copyright © 2016 Digby Andrews. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var lblName: UILabel!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.lblName.text = TableViewController.pokedex[TableViewController.currentIndex]["Name"]
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
}

