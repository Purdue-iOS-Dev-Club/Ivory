//
//  DatabaseHelper.swift
//  Ivory
//
//  Created by George Lo on 3/4/16.
//  Copyright © 2016 Purdue iOS Dev Club. All rights reserved.
//

import CoreData
import UIKit

class DatabaseHelper: NSObject {
    
    private var _databaseHelper: DatabaseHelper?
    let managedContext = ApplicationDelegate.managedObjectContext
    
    func sharedInstance() -> DatabaseHelper {
        if _databaseHelper == nil {
            _databaseHelper = DatabaseHelper()
        }
        return self._databaseHelper!
    }
    
    // MARK: Group
    
    func addNewGroup(id: Int, parentId: Int, silence: Bool, title: String, bulletinMessage: String, bulletinModified: String) -> Bool {
        let entity =  NSEntityDescription.entityForName("Group", inManagedObjectContext:managedContext)
        let group = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        group.setValue(NSNumber(integer: id), forKey: "id")
        group.setValue(NSNumber(integer: parentId), forKey: "parentId")
        group.setValue(NSNumber(bool: silence), forKey: "silence")
        group.setValue(title, forKey: "title")
        group.setValue(bulletinMessage, forKey: "bulletinMessage")
        group.setValue(bulletinModified, forKey: "bulletinModified")
        var success = true
        do {
            try managedContext.save()
        } catch {
            success = false
        }
        return success
    }
}
