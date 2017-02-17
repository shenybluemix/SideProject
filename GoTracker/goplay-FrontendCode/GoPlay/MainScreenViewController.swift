//
//  MainScreenViewController.swift
//  GoPlay
//
//  Created by Zonopact on 16/05/16.
//  Copyright © 2016 Zonopact. All rights reserved.
//

import UIKit



class MainScreenViewController: ExtensionViewController,webServicesDelegates  {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        self.setBgImage()
    }
    
    
    func responseFromWebServiceForGet(revDict: NSDictionary) {
        print(revDict)
        let array:NSMutableArray =  NSMutableArray(array: revDict.objectForKey("result") as! NSArray)
        NSUserDefaults.standardUserDefaults().setObject(array, forKey: goalsArray)
    }
    
    override func viewWillAppear(animated: Bool) {
        
      //  print(NSUserDefaults.standardUserDefaults().objectForKey(userLoginDictionary))

        
        let userId:String = webservices.sharedInstance.userid!
        
        webservices.sharedInstance.delegate = self
        
        
        webservices.sharedInstance.getDataFromServer("\(baseurl+getAllUserGoals)\(userId)")
        
        
        //Removing All Buttons
        for i in 0..<5 {
            if self.view.viewWithTag(Int(i+10)) != nil {
                (self.view.viewWithTag(Int(i+10)) as! UIButton).removeFromSuperview()
            }
            
        }
        
        for i in 0..<EventManager.sharedInstance.getPersistsNotificationsArray().count {
            
            let noti:UILocalNotification = (EventManager.sharedInstance.getPersistsNotificationsArray().objectAtIndex(i) as! NSDictionary).objectForKey("value") as! UILocalNotification
            
            let button:UIButton = UIButton(frame: CGRectMake(35,CGFloat(200+(i*60)) , 305, 50))
            button.layer.cornerRadius = 25.0;
            button.clipsToBounds = true
            button.tag = Int(i+10)
            button.setBackgroundImage(UIImage(named: "dark-bg"), forState: .Normal)
            button.setTitle("\(noti.alertBody!)", forState: UIControlState.Normal)
            button.addTarget(self, action:#selector(self.GoalButtonClicked), forControlEvents: .TouchUpInside)
            self.view.addSubview(button)
        }
        
    }
    
    func GoalButtonClicked(sender:UIButton) {
        
        let getNavigation:UINavigationController = self.slideMenuController()!.mainViewController as! UINavigationController
        
        let existingGoal:existingGoalViewController = (self.storyboard?.instantiateViewControllerWithIdentifier("existingGoalidentifier")) as! existingGoalViewController
        existingGoal.goalId = (EventManager.sharedInstance.getPersistsNotificationsArray().objectAtIndex(sender.tag-10) as! NSDictionary).objectForKey("id") as! String
         existingGoal.goalNamePro = (sender.titleLabel?.text!)!
        getNavigation.pushViewController(existingGoal, animated: false)
        self.slideMenuController()?.closeLeft()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func newGoalAction(sender: AnyObject)
    {
        print("New Goal Action")
        
        let getNavigation:UINavigationController = self.slideMenuController()!.mainViewController as! UINavigationController
        getNavigation.pushViewController((self.storyboard?.instantiateViewControllerWithIdentifier("newGoalidentifier"))!, animated: true)
        
    }
    
    //Get Inspired Button
    @IBAction func getInspiredAction(sender: AnyObject)
    {
        print("Get Inspired")
    }
    
    
    @IBAction func onSideMenuAction(sender: UIButton)
    {
        self.slideMenuController()?.openLeft()
    }
    
    
    @IBAction func existingGoalAction(sender: UIButton)
    {
        //Go to existingGoalidentifier
        let getNavigation:UINavigationController = self.slideMenuController()!.mainViewController as! UINavigationController

        let existingGoal:existingGoalViewController = (self.storyboard?.instantiateViewControllerWithIdentifier("existingGoalidentifier")) as! existingGoalViewController
        
        if let text = sender.titleLabel?.text {
        existingGoal.goalNamePro = text

        }
        getNavigation.pushViewController(existingGoal, animated:false)
        
        self.slideMenuController()?.closeLeft()
    }

}

