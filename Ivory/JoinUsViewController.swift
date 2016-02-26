//
//  JoinUsViewController.swift
//  Ivory
//
//  Created by George Lo on 2/5/16.
//  Copyright © 2016 Purdue iOS Dev Club. All rights reserved.
//

import UIKit

class JoinUsViewController: UITableViewController {
    
    let titles = [
        "Name",
        "Phone",
        "Email",
        "Position",
        "Comment"
    ]
    
    let placeholders = [
        "First Last",
        "Ex. 765-123-4567",
        "admin@apple.com",
        "CEO",
        "I want to apply for..."
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Join Us"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Send", style: UIBarButtonItemStyle.Done, target: self, action: "_sendRequest")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 5
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section <= 3 {
            return 50
        }
        return 120
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section <= 3 {
            let cell = tableView.dequeueReusableCellWithIdentifier("JoinUsNormalCell", forIndexPath: indexPath) as! JoinUsNormalCell
            cell.iconView.image = UIImage(named: titles[indexPath.section])
            cell.label.text = titles[indexPath.section]
            cell.textField.placeholder = placeholders[indexPath.section]
            cell.selectionStyle = .None
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("JoinUsLargeCell", forIndexPath: indexPath) as! JoinUsLargeCell
            cell.iconView.image = UIImage(named: titles[indexPath.section])
            cell.label.text = titles[indexPath.section]
            cell.textView.text = placeholders[indexPath.section]
            cell.selectionStyle = .None
            return cell
        }
    }
    
    // MARK: Private methods
    
    func _sendRequest() {
        let controller = UIAlertController(title: "Reminder", message: "You have already sent your application. Do you wish to send again?", preferredStyle: UIAlertControllerStyle.Alert)
        controller.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil))
        controller.addAction(UIAlertAction(title: "Send again", style: UIAlertActionStyle.Default, handler: { (action: UIAlertAction) in
            // TODO: Send to the server
        }))
        self.presentViewController(controller, animated: true, completion: nil)
    }

}
