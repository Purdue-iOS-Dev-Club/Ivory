//
//  ProfileViewController.swift
//  Ivory
//
//  Created by George Lo on 2/5/16.
//  Copyright © 2016 Purdue iOS Dev Club. All rights reserved.
//

import UIKit

class ProfileViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // change look of button
        
        
        
        self.title = "Profile"
        self.clearsSelectionOnViewWillAppear = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return 2
        } else if section == 1 {
            return 1
        } else if section == 2 {
            return 3
        } else if section == 3 {
            return 1
        }
        return 0
    }
    @IBAction func onLogout(sender: AnyObject) {
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        if indexPath.section == 3 {
            cell = tableView.dequeueReusableCellWithIdentifier("LogoutCell", forIndexPath: indexPath)
            cell.layoutMargins = UIEdgeInsetsZero
            cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 9999)
        } else if indexPath.section == 2 {
            if indexPath.row == 0 {
                cell = tableView.dequeueReusableCellWithIdentifier("AddCell", forIndexPath: indexPath)
            } else {
                cell = tableView.dequeueReusableCellWithIdentifier("ClassCell", forIndexPath: indexPath)
            }
        } else if indexPath.section == 1 {
            cell = tableView.dequeueReusableCellWithIdentifier("UniversityCell", forIndexPath: indexPath)
        } else if indexPath.section == 0 {
            if indexPath.row == 0 {
                cell = tableView.dequeueReusableCellWithIdentifier("AvatarCell", forIndexPath: indexPath)
            } else {
                cell = tableView.dequeueReusableCellWithIdentifier("NameCell", forIndexPath: indexPath)
            }
        } else {
            cell = tableView.dequeueReusableCellWithIdentifier("BlankCell", forIndexPath: indexPath)
        }
        
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
