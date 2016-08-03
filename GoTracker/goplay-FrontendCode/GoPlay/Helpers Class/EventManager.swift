//
//  EventManager.swift
//  GoPlay
//
//  Created by Zonopact on 01/06/16.
//  Copyright © 2016 Zonopact. All rights reserved.
//

import UIKit

class EventManager: NSObject {
    
    static let sharedInstance = EventManager()
    
    override init() {
        print("event manager runn")
    }
    
    
    //Creating Notification Method
    func createNotification(notiBody:String , notiTitle:String , days:String , goalId:String,daysofSuccess:String)
    {
        // Shedule Notification
        let notification = UILocalNotification()
        notification.timeZone = NSTimeZone.defaultTimeZone()
        let dateTime = NSDate()
        notification.fireDate = dateTime.dateByAddingTimeInterval(Double(days)!*60*60*24)
        //notification.fireDate = dateTime.dateByAddingTimeInterval(60)
        notification.alertBody = notiBody
        notification.alertTitle = notiTitle
        notification.userInfo = NSDictionary(objects: ["\(days)","\(daysofSuccess)"], forKeys: ["daysToShow","daysofSuccess"]) as [NSObject : AnyObject]
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    
        self.persistToUserDefaults(notification, goalId: goalId)
    }
    
    
    //Saving Notification to User Defaults
    func persistToUserDefaults(notification:UILocalNotification , goalId:String)
    {
        if NSUserDefaults.standardUserDefaults().objectForKey(notifsArray) != nil
        {
            let arrayData:NSData = NSUserDefaults.standardUserDefaults().objectForKey(notifsArray) as! NSData
            let array:NSMutableArray = NSKeyedUnarchiver.unarchiveObjectWithData(arrayData) as! NSMutableArray
            array.addObject(NSDictionary(objects: [notification,goalId], forKeys: ["value","id"]))
            let notificationData = NSKeyedArchiver.archivedDataWithRootObject(array)
            NSUserDefaults.standardUserDefaults().setObject(notificationData, forKey: notifsArray)
        }
        else
        {
            let array:NSMutableArray = NSMutableArray()
            array.addObject(NSDictionary(objects: [notification,goalId], forKeys: ["value","id"]))
            let notificationData = NSKeyedArchiver.archivedDataWithRootObject(array)
            NSUserDefaults.standardUserDefaults().setObject(notificationData, forKey: notifsArray)
        }
    }
    
    
    //Getting LocalNotifications Array
    func getPersistsNotificationsArray() -> NSMutableArray
    {
        if NSUserDefaults.standardUserDefaults().objectForKey(notifsArray) != nil
        {
            let arrayData:NSData = NSUserDefaults.standardUserDefaults().objectForKey(notifsArray) as! NSData
            let array:NSMutableArray =  NSKeyedUnarchiver.unarchiveObjectWithData(arrayData) as! NSMutableArray
            return array
        } else {
            return NSMutableArray()
        }
    }
    
    
    func deleteAPersistedLocalNotification(goalId:String)
    {
        for var goal in self.getPersistsNotificationsArray()
        {
            let noti:NSDictionary = goal as! NSDictionary
            if (noti.objectForKey("id") as! String) == goalId {
                //delete the goal
                self.deleteEventObject(noti)
            }
        }
    }
    
    
    func getAPersistedLocalNotificationWithId(goalId:String) -> NSDictionary? {
        for var goal in self.getPersistsNotificationsArray()
        {
            let noti:NSDictionary = goal as! NSDictionary
            if (noti.objectForKey("id") as! String) == goalId {
                //delete the goal
                return noti
            }
        }
        return nil
    }
    
    
    func cancellingAndReshedulingNotifications()
    {
        let arrayDatan:NSData = NSUserDefaults.standardUserDefaults().objectForKey(notifsArray) as! NSData
        let arrayn:NSMutableArray = NSKeyedUnarchiver.unarchiveObjectWithData(arrayDatan) as! NSMutableArray
        
        if UIApplication.sharedApplication().scheduledLocalNotifications!.count < arrayn.count {
            
            UIApplication.sharedApplication().cancelAllLocalNotifications()
            
            if NSUserDefaults.standardUserDefaults().objectForKey(notifsArray) != nil
            {
                let arrayData:NSData = NSUserDefaults.standardUserDefaults().objectForKey(notifsArray) as! NSData
                let array:NSMutableArray = NSKeyedUnarchiver.unarchiveObjectWithData(arrayData) as! NSMutableArray
                
                for var ele in array {
                    let oldNoti: UILocalNotification = ele.objectForKey("value") as! UILocalNotification
                    let rec:NSDictionary = oldNoti.userInfo!
                    let newValue = (rec.objectForKey("daysToShow")?.doubleValue)!
                    
                    let newNoti = UILocalNotification()
                    newNoti.timeZone = NSTimeZone.defaultTimeZone()
                    let dateTime = oldNoti.fireDate
                    // newNoti.fireDate = dateTime!.dateByAddingTimeInterval(newValue*60*60*24)
                    newNoti.fireDate = dateTime!.dateByAddingTimeInterval(newValue*60*60*24)
                    newNoti.alertBody = oldNoti.alertBody
                    newNoti.alertTitle = oldNoti.alertTitle
                    newNoti.userInfo = NSDictionary(objects: ["\(newValue)"], forKeys: ["daysToShow"]) as [NSObject : AnyObject]
                    UIApplication.sharedApplication().scheduleLocalNotification(newNoti)
                }
            }
        }
        
       // print(UIApplication.sharedApplication().scheduledLocalNotifications!)
    }

    
    func deleteEventObject(dict:NSDictionary) {
        
        //print("\(self.getPersistsNotificationsArray().indexOfObject(dict))")
        
        let arrayData:NSData = NSUserDefaults.standardUserDefaults().objectForKey(notifsArray) as! NSData
        let array:NSMutableArray = NSKeyedUnarchiver.unarchiveObjectWithData(arrayData) as! NSMutableArray
        array.removeObjectAtIndex(self.getPersistsNotificationsArray().indexOfObject(dict))
        let notificationData = NSKeyedArchiver.archivedDataWithRootObject(array)
        NSUserDefaults.standardUserDefaults().setObject(notificationData, forKey: notifsArray)
        
        self.cancellingAndReshedulingNotifications()
    }

}