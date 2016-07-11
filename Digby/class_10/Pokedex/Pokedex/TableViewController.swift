//
//  TableViewController.swift
//  Pokedex
//
//  Created by Digby Andrews on 2016-07-08.
//  Copyright © 2016 Digby Andrews. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController
{
    internal static var currentIndex = 0
    
    internal static let pokedex =
    [
        ["Name": "Bulbasaur", "Height": "0.7m",],
        ["Name": "Ivysaur", "Height": "1m"],
        ["Name": "Venosaur", "Height": "2m"],
        ["Name": "Squirtle", "Height": "0.4m"],
        ["Name": "Wartotle", "Height": "0.6m"],
        ["Name": "Blastoise", "Height": "2m"],
        ["Name": "Charmander", "Height": "0.9m"],
        ["Name": "Charmeleon", "Height": "1.5m"],
        ["Name": "Charizard", "Height": "3m"]
    ]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return TableViewController.pokedex.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell = self.tableView.dequeueReusableCellWithIdentifier("CellId")
        if cell == nil
        {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "CellId")
        }
        
        cell!.textLabel?.text = TableViewController.pokedex [indexPath.row]["Name"]
        return cell!
    }
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath?
    {
        TableViewController.currentIndex = indexPath.row
        return indexPath
    }
    

}
