//
//  ServerHelper.swift
//  Ivory
//
//  Created by George Lo on 3/4/16.
//  Copyright © 2016 Purdue iOS Dev Club. All rights reserved.
//

import UIKit

class ServerHelper: NSObject {
    
    private var _serverHelper: ServerHelper?
    
    // MARK: Init
    
    func sharedInstance() -> ServerHelper {
        if _serverHelper == nil {
            _serverHelper = ServerHelper()
        }
        return self._serverHelper!
    }
    
    // MARK: Group
    
    func createNewGroup() {
        
    }
    
    func joinGroup() {
        
    }
    
    // MARK: User
    
    func register() {
        
    }
    
    func loginWithEmail() {
        
    }
    
    func loginWithFacebook() {
        
    }
}
