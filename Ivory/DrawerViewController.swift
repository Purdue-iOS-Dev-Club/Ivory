//
//  MainViewController.swift
//  Ivory
//
//  Created by George Lo on 2/5/16.
//  Copyright © 2016 Purdue iOS Dev Club. All rights reserved.
//

import UIKit
import KYDrawerController

class DrawerViewController: UITableViewController {
    
    private let sections = ["Chat Room", "Profile", "Settings", "Join us"]
    
    private var selectedIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Main"
        
        self.tableView.rowHeight = 50
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "CellIdentifier")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return NSBundle.mainBundle().loadNibNamed("DrawerHeaderView", owner: self, options: nil).first as? UIView
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath: indexPath)

        cell.imageView?.image = UIImage(named: sections[indexPath.row])
        cell.textLabel?.font = UIFont.boldSystemFontOfSize(17)
        cell.textLabel?.text = sections[indexPath.row]
        
        if self.selectedIndex == indexPath.row {
            tableView.selectRowAtIndexPath(indexPath, animated: false, scrollPosition: UITableViewScrollPosition.None)
        }

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.selectedIndex = indexPath.row
        
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
        vc.navigationItem.leftBarButtonItem = Utils.SideMenuBarButtonItem()
        (UIApplication.sharedApplication().delegate as! AppDelegate).drawerController?.mainViewController = nc
        (UIApplication.sharedApplication().delegate as! AppDelegate).drawerController?.setDrawerState(KYDrawerController.DrawerState.Closed, animated: true)
    }

}
