//
//  AccountViewController.swift
//  Ivory
//
//  Created by George Lo on 2/5/16.
//  Copyright © 2016 Purdue iOS Dev Club. All rights reserved.
//

import Alamofire
import UIKit
import KYDrawerController
import FBSDKLoginKit

class AccountViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    //FACEBOOK BUTTONS
    //START HERE
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        print("User Logged In")
        Alamofire.request(.GET, "http://162.243.22.154:3939/auth/facebook/token/?access_token=\(FBSDKAccessToken.currentAccessToken().tokenString)")
            .responseJSON { response in
                print(response)
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
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("User Logged Out")
    }

    //END HERE
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (FBSDKAccessToken.currentAccessToken() != nil)
        {
            Alamofire.request(.GET, "http://162.243.22.154:3939/auth/facebook/token/?access_token=\(FBSDKAccessToken.currentAccessToken().tokenString)")
                .responseJSON { response in
                    print(response)
            }
            // User is already logged in, do work such as go to next view controller.
        }
        else
        {
            let loginView : FBSDKLoginButton = FBSDKLoginButton()
            self.view.addSubview(loginView)
            loginView.center = self.view.center
            loginView.readPermissions = ["public_profile", "email", "user_friends"]
            loginView.delegate = self
        }

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBarHidden = true
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.navigationBarHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signInFacebookAction(sender: AnyObject) {
        self.performSegueWithIdentifier("toUniversity", sender: self)
    }

    @IBAction func proceedToMain(sender: AnyObject) {
        let chatNC = UIStoryboard(name: "ChatRoom", bundle: nil).instantiateInitialViewController()
        let drawerController     = KYDrawerController()
        drawerController.mainViewController = chatNC!
        drawerController.drawerViewController = DrawerViewController()
        (UIApplication.sharedApplication().delegate as! AppDelegate).drawerController = drawerController
        self.presentViewController(drawerController, animated: true, completion: nil)
        (chatNC as! UINavigationController).viewControllers[0].navigationItem.leftBarButtonItem = Utils.SideMenuBarButtonItem()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
