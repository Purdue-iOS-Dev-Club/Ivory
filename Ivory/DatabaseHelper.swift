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
    
    // MARK: Group
    
    class func addNewGroup(id: String, parentId: String, silence: Bool, title: String, bulletinMessage: String, bulletinModified: String) -> Bool {
        let managedContext = ApplicationDelegate.managedObjectContext
        let entity =  NSEntityDescription.entityForName("Group", inManagedObjectContext:managedContext)
        let group = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        group.setValue(id, forKey: "id")
        group.setValue(parentId, forKey: "parentId")
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
