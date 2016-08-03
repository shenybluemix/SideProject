//
//  addGoalViewController.swift
//  GoPlay
//
//  Created by Zonopact on 17/05/16.
//  Copyright © 2016 Zonopact. All rights reserved.
//

import UIKit

class addGoalViewController: ExtensionViewController,webServicesDelegates {
    
    @IBOutlet weak var descText: UITextField!
    @IBOutlet weak var numOfDays: UITextField!
    var addToCategory:String? = String();

    var isEditGoal:Bool?
    var goalID:String = String()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let _ = isEditGoal {
            
            if isEditGoal! {
                let noti:UILocalNotification = (EventManager.sharedInstance.getAPersistedLocalNotificationWithId(self.goalID)! as NSDictionary).objectForKey("value") as! UILocalNotification
                self.descText.text = noti.alertBody
                self.addToCategory = noti.alertTitle
                self.numOfDays.text = (noti.userInfo! as NSDictionary).objectForKey("daysToShow") as? String
            }
            
        }
        else
        {
            isEditGoal = false
        }
       
        
        self.setBgImage()
        
        
        self.descText.leftView = UIView(frame: CGRectMake(0,0,20,10))
        self.descText.leftViewMode = .Always
        
        self.numOfDays.leftView = UIView(frame: CGRectMake(0,0,20,10))
        self.numOfDays.leftViewMode = .Always
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSideMenuAction(sender: UIButton)
    {
        self.slideMenuController()?.openLeft()
    }
    
    
    @IBAction func finishAction(sender: AnyObject)
    {
        if let _ = isEditGoal {
            if !(isEditGoal!) {
                self.createGoalFunction()
            } else {
                self.editGoalFunction()
            }
        } else {
            self.createGoalFunction()
        }
        
    }
    
    
    func createGoalFunction()
    {
     
        guard let text = self.descText.text where !text.isEmpty else {
            self.showAlert()
            return
        }
        
        guard let dtext = self.numOfDays.text where !dtext.isEmpty else {
            self.showAlert()
            return
        }
        
       if (EventManager.sharedInstance.getPersistsNotificationsArray().count == 5)
       {
        self.showAlert5()
        return;
       }
        let date = NSDate()
        let dayTimePeriodFormatter = NSDateFormatter()
        dayTimePeriodFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dayTimePeriodFormatter.stringFromDate(date)
        
//        let userId:String = (NSUserDefaults.standardUserDefaults().objectForKey(userLoginDictionary) as! NSDictionary).objectForKey("data")!.objectForKey("id") as! String

        let userId:String = webservices.sharedInstance.userid!
        
        
       // {"category":"fd","user_id":"1","start_date":"2016-12-24","description":"dfsfdgd gdg r","no_of_days":1}
        
        let jsonParms = ["category":addToCategory!,
                         "user_id":userId,
                         "start_date":dateString,
                         "description":self.descText.text!,"no_of_days":dtext]
        
        print(jsonParms)
        
        webservices.sharedInstance.delegate = self
        webservices.sharedInstance.postDataToServer(jsonParms, url: createGoal)
    }
    
    func editGoalFunction()
    {
        print(EventManager.sharedInstance.getAPersistedLocalNotificationWithId(self.goalID))
        
        guard let text = self.descText.text where !text.isEmpty else {
            self.showAlert()
            return
        }
        
        guard let dtext = self.numOfDays.text where !dtext.isEmpty else {
            self.showAlert()
            return
        }
        
        let date = NSDate()
        let dayTimePeriodFormatter = NSDateFormatter()
        dayTimePeriodFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dayTimePeriodFormatter.stringFromDate(date)
        
//       {"goal_id":"1","category":"fd1","start_date":"2016-12-26","description":"dfsfdgd gdg r11","no_of_days":"12"}
        
        let userid:String = webservices.sharedInstance.userid!
        
        let jsonParms = ["goal_id":self.goalID,
                         "category":addToCategory!,
                         "start_date":dateString,
                         "description":self.descText.text!,
                         "no_of_days":self.numOfDays.text!,"user_id":userid]
        
        print(jsonParms)
        
        webservices.sharedInstance.delegate = self
        webservices.sharedInstance.postDataToServer(jsonParms, url: editGoal)
    }
    

    func showAlert() {
        let alertController = UIAlertController(title: "Error!", message: "Insufficient Information!", preferredStyle: .Alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(defaultAction)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
    func showAlert5() {
        let alertController = UIAlertController(title: "No More Goals!", message: "YOU CAN CREATE MAX 5 GOALS.!", preferredStyle: .Alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(defaultAction)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
    
  
    
    func responseFromWebServiceForPost(revDict: NSDictionary) {
        
        print(revDict)
        
        if !isEditGoal! {
            
            EventManager.sharedInstance.createNotification(descText.text!, notiTitle: addToCategory!, days: self.numOfDays.text! ,goalId: "\(revDict.objectForKey("result")!.objectForKey("goal_id")!)")
            let getNavigation:UINavigationController = self.slideMenuController()!.mainViewController as! UINavigationController
            getNavigation.popToRootViewControllerAnimated(true)
            
        }
        
        //goal updated successfuly
        if (isEditGoal!) {
            
            EventManager.sharedInstance.deleteAPersistedLocalNotification(goalID)
            EventManager.sharedInstance.createNotification(descText.text!, notiTitle: addToCategory!, days: self.numOfDays.text! ,goalId: "\(revDict.objectForKey("result")!.objectForKey("goal_id")!)")
            
            let getNavigation:UINavigationController = self.slideMenuController()!.mainViewController as! UINavigationController
            getNavigation.popToRootViewControllerAnimated(true)
            
        }
    }
}
