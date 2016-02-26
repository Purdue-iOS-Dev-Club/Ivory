//
//  SettingsViewController.swift
//  Ivory
//
//  Created by George Lo on 2/5/16.
//  Copyright © 2016 Purdue iOS Dev Club. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {
    
    let items = [
        "Like us on Facebook",
        "Feedback"
    ]
    
    let images = [
        "Facebook",
        "Feedback"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Settings"
        self.clearsSelectionOnViewWillAppear = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath: indexPath)
        
        cell.imageView?.image = UIImage(named: images[indexPath.section])
        cell.textLabel?.text = items[indexPath.section]
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        return cell
    }

}
