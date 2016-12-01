//
//  ViewController.swift
//  CoreDataExample
//
//  Created by Luiz on 2016-12-01.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UITableViewController {
    
    var arr:[User] = []
    
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    let entityUser = NSEntityDescription.entity(forEntityName: "User", in: ((UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext)!)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let fetchRequest = NSFetchRequest<User>(entityName: "User")
        
        do {
            self.arr = try self.context!.fetch(fetchRequest)
        } catch {
            print("error fetching")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath)
        
        cell.textLabel?.text = arr[indexPath.row].name
        
        return cell
    }
    

    @IBAction func btnAddClicked(_ sender: Any) {
        let alertController = UIAlertController(title: "Add User", message: "Include a user to the database?", preferredStyle: .alert)
        
        alertController.addTextField()
        
        let saveAction = UIAlertAction(title: "Save", style: .default) {
            action in
            // magic happens here
            if let value = alertController.textFields?.first?.text {
                let user = User(entity: self.entityUser!, insertInto: self.context)
                user.name = value
                self.arr.append(user)
                self.tableView.reloadData()
                
                do {
                    try self.context?.save()
                } catch {
                    print("error saving")
                }
            }
        }
        
        alertController.addAction(saveAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        alertController.addAction(cancelAction)
    
        present(alertController, animated: true)
    }

}

