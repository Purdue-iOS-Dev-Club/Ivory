//
//  RegisterViewController.swift
//  Ivory
//
//  Created by George Lo on 2/5/16.
//  Copyright © 2016 Purdue iOS Dev Club. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    let serverConnector = ServerHelper()

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    // MARK : Activity indicator >>>>>
    
    private var blur = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.Light))
    private var spinner = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.WhiteLarge)
    
    func activityIndicator() {
        
        blur.frame = CGRectMake(30, 30, 60, 60)
        blur.layer.cornerRadius = 10
        blur.center = self.view.center
        blur.clipsToBounds = true
        
        spinner.frame = CGRectMake(0, 0, 50, 50)
        spinner.hidden = false
        spinner.center = self.view.center
        spinner.startAnimating()
        
        self.view.addSubview(blur)
        self.view.addSubview(spinner)
    }
    
    func stopActivityIndicator() {
        spinner.stopAnimating()
        spinner.removeFromSuperview()
        blur.removeFromSuperview()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        stopActivityIndicator()
    }
    // <<<<<
    
    // Mark : Text field >>>>>
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == self.emailTextField {
            self.passwordTextField.becomeFirstResponder()
        } else if textField == self.passwordTextField {
            self.confirmPasswordTextField.becomeFirstResponder()
        } else if textField == self.confirmPasswordTextField {
            textField.resignFirstResponder()
        }
        return true
    }

    func textFieldShouldEndEditing(textField: UITextField!) -> Bool {
        return true
    }
    
    func DismissKeyboard () {
        view.endEditing(true)
    }
    // <<<<<
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Register"
        
        // Mark : Text field 
        // Tab The blank place, close keyboard
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerButtonTapped(sender: AnyObject) {
        
        let email = emailTextField.text!
        let password = passwordTextField.text!
        let confirmPassword = confirmPasswordTextField.text!
        
        if ( email.isEmpty || password.isEmpty || confirmPassword.isEmpty ) {
            let myAlert = UIAlertController(title: "Register Failed", message: "You must fill in all of the fields.", preferredStyle: UIAlertControllerStyle.Alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
            myAlert.addAction(okAction)
            self.presentViewController(myAlert, animated:true, completion:nil)
            return
        }
        if ( password != confirmPassword ) {
            let myAlert = UIAlertController(title: "Register Failed", message: "Password does not match.", preferredStyle: UIAlertControllerStyle.Alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
            myAlert.addAction(okAction)
            self.presentViewController(myAlert, animated:true, completion:nil)
            return
        }
    /* Email Check
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        if ( emailTest.evaluateWithObject(email) ) {
            let myAlert = UIAlertController(title: "Register Failed", message: "Please enter a valid email address.", preferredStyle: UIAlertControllerStyle.Alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
            myAlert.addAction(okAction)
            self.presentViewController(myAlert, animated:true, completion:nil)
            return
        }
    */

        // connect to server
        let parameter : [String:AnyObject] = [
            "email" : email,
            "password" : password
        ]
        
        serverConnector.register(parameter, view: self)
        
        if (accountToken != nil) {
            
            let myAlert = UIAlertController(title: "Registration Successful", message: "Welcom to Ivory!", preferredStyle: UIAlertControllerStyle.Alert)
            
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: { (action: UIAlertAction!) in
                self.performSegueWithIdentifier("registerToUniversuty", sender: self)
            })
            myAlert.addAction(okAction)
            self.presentViewController(myAlert, animated:true, completion:nil)        }
        
    }
    
    func registerSuccessfulProcess () {
        // Save user profile to local? Switch view
        
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
