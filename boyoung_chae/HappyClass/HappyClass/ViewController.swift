//
//  ViewController.swift
//  HappyClass
//
//  Created by Boyoung on 2016-10-20.
//  Copyright © 2016 Boyoung. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtAdd: UITextField!
    
    static var names = [[String:String]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ViewController.names += [["name":"John", "address":"123 Main St"]]
        ViewController.names += [["name":"Mary", "address":"123 Hastings St"]]
        ViewController.names += [["name":"Ontario", "address":"On Canada"]]
        ViewController.names += [["name":"British Columbia", "address":"BC Canada"]]
        ViewController.names += [["name":"Alberta", "address":"AB Canada"]]
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ViewController.names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        cell.textLabel?.text = ViewController.names[indexPath.row]["name"]
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        
        DetailViewController.object = ViewController.names[indexPath.row]
        return indexPath
    }
    
    @IBAction func btnAddClicked(_ sender: AnyObject) {
        
        if let name = self.txtName.text, let address = self.txtAdd.text {
            ViewController.names += [["name" : name, "address" : address]]
            self.tableView.reloadData()
            print("Success!")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

