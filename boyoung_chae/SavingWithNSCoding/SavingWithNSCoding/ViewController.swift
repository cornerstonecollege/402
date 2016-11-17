//
//  ViewController.swift
//  SavingWithNSCoding
//
//  Created by Boyoung on 2016-11-16.
//  Copyright © 2016 Boyoung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtAge: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = DataSourcHelper.sharedInstance
        self.tableView.dataSource = DataSourcHelper.sharedInstance
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addClicked(_ sender: AnyObject) {
        let person = Person(name: self.txtName.text, age: Int(self.txtAge.text!))
        DataSourcHelper.sharedInstance.arr.append(person)
        
        self.tableView.reloadData()
        
    }

    @IBAction func deleteClicked(_ sender: AnyObject) {
        var index = self.tableView.indexPathForSelectedRow
        DataSourcHelper.sharedInstance.arr.remove(at: (index?.item)!)
        
        self.tableView.reloadData()
    }
}

