//
//  ViewController.swift
//  hghgh
//
//  Created by Luiz on 2016-11-30.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let j = NSEntityDescription.entity(forEntityName: "Person", in: context)
        
        let jaca = NSManagedObject(entity: j!, insertInto: context)
        jaca.setValue("brau", forKey: "jaca")
        
        do {
         try context.save()
        } catch {
            
        }
        
        
        let req = NSFetchRequest<NSManagedObject>(entityName: "Person")
        
        do {
            let arr = try context.fetch(req)
            print (arr)
        } catch {
            
        }
        
        
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        let alert = UIAlertController(title: "brau", message: "brau 2", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "save", style: .default) { action in
            print(alert.textFields?.first?.text)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        
        alert.addTextField()
        alert.addAction(saveAction)
        alert.addAction(cancelAction) 
        present(alert, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

