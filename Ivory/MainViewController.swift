//
//  MainViewController.swift
//  Ivory
//
//  Created by George Lo on 2/5/16.
//  Copyright © 2016 Purdue iOS Dev Club. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {
    
    private let sections = ["Chat Room", "Profile", "Settings", "Join us"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Main"
        self.clearsSelectionOnViewWillAppear = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath: indexPath)

        cell.textLabel?.text = sections[indexPath.row]

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var sb: UIStoryboard?
        
        if indexPath.row == 0 {
            sb = UIStoryboard(name: "ChatRoom", bundle: nil)
        } else if indexPath.row == 1 {
            sb = UIStoryboard(name: "Profile", bundle: nil)
        } else if indexPath.row == 2 {
            sb = UIStoryboard(name: "Settings", bundle: nil)
        } else if indexPath.row == 3 {
            sb = UIStoryboard(name: "JoinUs", bundle: nil)
        }
        
        assert(sb != nil)
        
        let nc = sb?.instantiateInitialViewController() as! UINavigationController
        let vc = nc.viewControllers[0]
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
