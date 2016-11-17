//
//  ViewController.swift
//  SavingWithNSCoding
//
//  Created by Luiz on 2016-11-16.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var Age: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = DataSourceHelper.sharedInstance
        self.tableView.dataSource = DataSourceHelper.sharedInstance
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addClicked(_ sender: Any) {
        let person = Person(name: self.txtName.text as NSString?, age: NSNumber(integerLiteral: Int(self.Age.text!)!))
        DataSourceHelper.sharedInstance.arr.append(person)
        self.tableView.reloadData()
    }
    
}

