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
    
    class func addMessage(senderId: String, recipientId: String, message: String, group: Int) -> Bool {
        let managedContext = ApplicationDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest()
        fetchRequest.entity = NSEntityDescription.entityForName("Group", inManagedObjectContext:managedContext)
        fetchRequest.predicate = NSPredicate(format: "id == %@", recipientId)
        let result = try! managedContext.executeFetchRequest(fetchRequest)
        assert(result.count == 1)
        let group = result[0] as! NSManagedObject
        let messages = group.valueForKey("messages")
        
        let entity =  NSEntityDescription.entityForName("Message", inManagedObjectContext:managedContext)
        let message = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        message.setValue(senderId, forKey: "userId")
        message.setValue(message, forKey: "text")
        messages?.addObject(message)
        
        var success = true
        do {
            try managedContext.save()
        } catch {
            success = false
        }
        return success
    }
}
