//
//  SubgroupsViewController.swift
//  Ivory
//
//  Created by George Lo on 2/5/16.
//  Copyright © 2016 Purdue iOS Dev Club. All rights reserved.
//

import UIKit

class SubgroupsViewController: UITableViewController, UISearchResultsUpdating, UISearchBarDelegate, UISearchControllerDelegate {
    
    let names = [
        "Group 1",
        "Group 2",
        "Group 3",
        "Group 4",
        "Group 5",
        "Group 6",
        "Group 7",
        "Group 8",
        "Group 9",
        "Group 10",
        "Group 11",
        "Group 12",
        "Group 13",
        "Group 14",
        "Group 15",
        "Group 16",
        "Group 17",
        "Group 18",
        "Group 19",
        "Group 20",
    ]
    
    var searchController: UISearchController!
    var resultsTableController: SubgroupsResultsViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Subgroups"
        self.clearsSelectionOnViewWillAppear = true
        
        resultsTableController = SubgroupsResultsViewController()
        resultsTableController.tableView.delegate = self
        searchController = UISearchController(searchResultsController: resultsTableController)
        searchController.searchResultsUpdater = self
        searchController.searchBar.sizeToFit()
        tableView.tableHeaderView = searchController.searchBar
        searchController.delegate = self
        searchController.searchBar.delegate = self
        definesPresentationContext = true
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
        return names.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath: indexPath)
        cell.imageView?.image = UIImage(named: "Subgroup")
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }
    
    // MARK: UISearchBarDelegate
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    // MARK: UISearchResultsUpdating
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        var searchText = searchController.searchBar.text
        if searchText == nil {
            searchText = ""
        }
        let resultsController = searchController.searchResultsController as! SubgroupsResultsViewController
        resultsController.groups = self.names.filter { $0.rangeOfString(searchText!) != nil }
        resultsController.tableView.reloadData()
    }

}
