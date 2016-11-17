//
//  DataSourceHelper.swift
//  SavingWithNSCoding
//
//  Created by Luiz on 2016-11-16.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

import UIKit

class DataSourceHelper : NSObject, UITableViewDelegate, UITableViewDataSource
{
    static let sharedInstance = DataSourceHelper()
    var arr:[Person] = []
    
    func loadInfo() {
        if let arr = NSKeyedUnarchiver.unarchiveObject(withFile: self.filepath()) as? [Person] {
            self.arr = arr
        }
    }
    
    func saveInfo() {
        
        NSKeyedArchiver.archiveRootObject(self.arr, toFile: self.filepath())
    }
    
    private func filepath() -> String {
        
        let manager = FileManager.default
        let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first
        return url!.appendingPathComponent("file.archiver").path
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath)
        cell.textLabel?.text = arr[indexPath.row].name as String?
        
        return cell
    }
}
