//
//  ServerHelper.swift
//  Ivory
//
//  Created by George Lo on 3/4/16.
//  Copyright © 2016 Purdue iOS Dev Club. All rights reserved.
//

import UIKit
import Alamofire

public var accountToken : String?

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
    
    func register(parameter : [String:AnyObject], view : AnyObject) {
        
        Alamofire.request(.POST, "http://162.243.22.154:3939/auth/local/register", parameters: parameter)
            .responseString { response in
                
                print(response)

                if ( response.response?.statusCode != 200 ) {
                    print("Error : Register status code invalid")
                    let myAlert = UIAlertController(title: "Register Failed", message: "Email exists. Please login", preferredStyle: UIAlertControllerStyle.Alert)
                    let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
                    myAlert.addAction(okAction)
                    view.presentViewController(myAlert, animated:true, completion:nil)
                }
                
                else {
                    // TODO :
                    // accountToken = response.data!.valueForKeyPath("token") as? String
                }
        }
    }
    
    func loginWithEmail(parameter : [String:AnyObject], view : AnyObject) {
        
        Alamofire.request(.POST, "http://162.243.22.154:3939/auth/local/login", parameters: parameter)
            .responseJSON { response in
                
                print(response)
                
                if ( response.response?.statusCode != 200 ) {
                    print("Error : Login status code invalid")
                    let myAlert = UIAlertController(title: "Login Failed", message: "Wrong email or password.", preferredStyle: UIAlertControllerStyle.Alert)
                    let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
                    myAlert.addAction(okAction)
                    view.presentViewController(myAlert, animated:true, completion:nil)
                }
                    
                else {
                    // TODO :
                    // accountToken = response.data?.valueForKey("token") as? String
                }
                
        }
    }
    
    func loginWithFacebook() {
        
    }
}
