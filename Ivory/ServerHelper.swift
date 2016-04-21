//
//  ServerHelper.swift
//  Ivory
//
//  Created by George Lo on 3/4/16.
//  Copyright © 2016 Purdue iOS Dev Club. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Alamofire


var currentUserId: String?
var currentUserToken: String?

class ServerHelper: NSObject {
    
    // WebSocket functions
    
    func authenticate() {
        ApplicationDelegate.wsclient.writeObject(["token": ApplicationDelegate.tokenString!])
    }
    
    func sendMessage() {
        
    }
    
    // MARK: Group
    
    class func createNewGroup() {
        
    }
    
    class func joinGroup() {
        
    }
    
    // MARK: User
    
    class func register() {
        
    }
    
    class func loginWithEmail() {
        
    }
    
    class func loginWithFacebook(view:UIViewController, completion: (result: AnyObject?, error: NSError?) -> ()){
        
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        
        fbLoginManager.logInWithReadPermissions(["public_profile", "email", "user_friends"], fromViewController: view) { (result:FBSDKLoginManagerLoginResult!, error:NSError!) -> Void in
            print("User Logged In")
            
            Alamofire.request(.GET, "http://162.243.22.154:3939/auth/facebook/token/?access_token=\(FBSDKAccessToken.currentAccessToken().tokenString)").responseJSON { response in
                print(response.result.value)

                let responseResult = response.result.value as! NSDictionary
                currentUserId = responseResult["profile"]!["_id"] as? String
                currentUserToken = responseResult["token"] as? String
                
                completion(result: responseResult, error: nil)
            }
            
            
            if ((error) != nil)
            {
                // Process error
            }
            else if result.isCancelled {
                // Handle cancellations
            }
            else {
                // If you ask for multiple permissions at once, you
                // should check if specific permissions missing
                if result.grantedPermissions.contains("email")
                {
                    // Do work
                }
            }
        }

        
    }
}
