//
//  RoomInfoViewController.swift
//  Ivory
//
//  Created by George Lo on 2/5/16.
//  Copyright © 2016 Purdue iOS Dev Club. All rights reserved.
//

import UIKit

class RoomInfoViewController: UITableViewController {
    
    private let titles = [
        ["Bulletin Board", "Edit"],
        ["Members", "Subgroups"],
        ["Silence"]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Room Info"
        self.clearsSelectionOnViewWillAppear = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return titles.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles[section].count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath: indexPath)

        cell.textLabel?.text = titles[indexPath.section][indexPath.row]

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch titles[indexPath.section][indexPath.row] {
        case "Members":
            self.performSegueWithIdentifier("toMembers", sender: self)
        case "Subgroups":
            self.performSegueWithIdentifier("toSubgroups", sender: self)
        default:
            return
        }
    }

}
