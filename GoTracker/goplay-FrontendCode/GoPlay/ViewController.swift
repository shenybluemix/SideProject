//
//  ViewController.swift
//  GoPlay
//
//  Created by Zonopact on 16/05/16.
//  Copyright © 2016 Zonopact. All rights reserved.
//

import UIKit
import SVProgressHUD
import FBSDKLoginKit


class ViewController: ExtensionViewController,webServicesDelegates {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setBgImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func facebookLoginAction(sender: AnyObject) {
        
       let fbloginManager = FBSDKLoginManager()
        fbloginManager.logInWithReadPermissions(["public_profile", "email", "user_friends"], fromViewController: self) {
            (result, error) -> Void in
            
            if ((error) != nil) {
                SVProgressHUD.showErrorWithStatus("Login Unsuccessful")
            } else if (result.isCancelled) {
                SVProgressHUD.showErrorWithStatus("Canceled")
            } else {
                SVProgressHUD.showWithStatus("LOGGING IN FACEBOOK..")
                self.getFacebookUserProfile()
            }
        }
    }
    
  
    @IBAction func noLoginAction(sender: AnyObject)
    {
        self.performSelector(#selector(ViewController.navigate), withObject: nil, afterDelay: 0.5)
    }
    
    func getFacebookUserProfile() {
        
        if((FBSDKAccessToken.currentAccessToken()) != nil) {
            
            //Needs Permissions -> Email (R), university, gender, city , friends (O)
            
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id,name,email,gender,age_range"]).startWithCompletionHandler({ (connection, result, error) -> Void in
                if (error == nil) {
                    
                    print("Facebook Profile data -> \(result)")
                    let facebookdata:NSDictionary = result as! NSDictionary
                    
                    var email:String = ""
                    if let value = facebookdata.objectForKey("email") {
                        email = value as! String
                    }
                    
                   
                    var name:String = ""
                    if let value = facebookdata.objectForKey("name") {
                        name = String (value)
                    }
                    var gender:String = ""
                    if let value = facebookdata.objectForKey("gender") {
                        gender = value as! String
                    }

                    
//                    var dob:String = ""
//                    if let value = (facebookdata.objectForKey("age_range") as! NSDictionary).objectForKey("min") {
//                        dob = (value as! NSNumber).stringValue
//                    }
                    var facebook_id:String = ""
                    if let value = facebookdata.objectForKey("id") {
                        facebook_id = value as! String
                    }
                    
                    
                    let data = ["facebook_id":facebook_id,"email":email,"name":name,"date_of_birth":"2016-12-24","gender":gender]
                    
                    webservices.sharedInstance.delegate = self
                    webservices.sharedInstance.postDataToServer(data, url: facebookLogin)
                }
            })
        }
        
    }
    
    
    func responseFromWebServiceForPost(revDict: NSDictionary) {
        print(revDict)
        
        let response:NSDictionary  = revDict.objectForKey("result") as! NSDictionary
             SVProgressHUD.setDefaultMaskType(.Gradient)
             SVProgressHUD.showSuccessWithStatus("Login Successful")
            
            NSUserDefaults.standardUserDefaults().setObject(response, forKey: userLoginDictionary)
            self.performSelector(#selector(ViewController.navigate), withObject: nil, afterDelay: 0.5)
    }
   
    
    func navigate()
    {
        self.performSegueWithIdentifier("loginSegue", sender: nil)
    }
}

