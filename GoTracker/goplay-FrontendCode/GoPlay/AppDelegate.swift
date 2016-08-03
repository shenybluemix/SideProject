//
//  AppDelegate.swift
//  GoPlay
//
//  Created by Zonopact on 16/05/16.
//  Copyright © 2016 Zonopact. All rights reserved.
//



import UIKit
import FBSDKCoreKit
import FBSDKShareKit
import FBSDKLoginKit
import IQKeyboardManagerSwift
import SVProgressHUD


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.

        sleep(3)
        
        IQKeyboardManager.sharedManager().enable = true
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        
        
        //Local Notifications Settings
        UIApplication.sharedApplication().registerUserNotificationSettings(UIUserNotificationSettings(forTypes: [.Alert, .Badge, .Sound] , categories: nil))
        
        
        //Setting View Controller
        if let _ = NSUserDefaults.standardUserDefaults().objectForKey(userLoginDictionary)
        {
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let conCtrl:ContainerViewController  = mainStoryboard.instantiateViewControllerWithIdentifier("ContainerViewIdentifier") as! ContainerViewController
            self.window?.rootViewController = conCtrl
            self.window?.makeKeyAndVisible()
           
            let shareData = webservices.sharedInstance
           
            let userData = NSUserDefaults.standardUserDefaults().objectForKey(userLoginDictionary)
            
              shareData.userid = ((userData as! NSDictionary).objectForKey("id") as! NSNumber).stringValue
        }
       webservices.sharedInstance.userid = "1"
        return true
    }
    

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
        FBSDKAppEvents.activateApp()
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        return FBSDKApplicationDelegate.sharedInstance().application(application, openURL: url, sourceApplication: sourceApplication, annotation: annotation)
    }
    
    
    func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification) {
        
        let rec:NSDictionary = notification.userInfo!
        let newValue = (rec.objectForKey("daysToShow")?.doubleValue)!
        
        
        if application.applicationState == .Active {
            SVProgressHUD.showInfoWithStatus(notification.alertBody)
        }
            
            print("Sheduling new noti with Values -> \(newValue*60*60*24)")
            
            let newNoti = UILocalNotification()
            newNoti.timeZone = NSTimeZone.defaultTimeZone()
            let dateTime = notification.fireDate
           // newNoti.fireDate = dateTime!.dateByAddingTimeInterval(newValue*60*60*24)
            newNoti.fireDate = dateTime!.dateByAddingTimeInterval(60)
            newNoti.alertBody = notification.alertBody
            newNoti.alertTitle = notification.alertTitle
            newNoti.userInfo = NSDictionary(objects: ["\(newValue)"], forKeys: ["daysToShow"]) as [NSObject : AnyObject]
            UIApplication.sharedApplication().scheduleLocalNotification(newNoti)
        
        
        //Cancelling notifications
        UIApplication.sharedApplication().cancelLocalNotification(notification)
    }
    
    func application(application: UIApplication, handleActionWithIdentifier identifier: String?, forLocalNotification notification: UILocalNotification, completionHandler: () -> Void) {
        print("handle action")
    }
    
    func application(application: UIApplication, handleActionWithIdentifier identifier: String?, forLocalNotification notification: UILocalNotification, withResponseInfo responseInfo: [NSObject : AnyObject], completionHandler: () -> Void) {
        print("handle action nn")
    }
    


}

