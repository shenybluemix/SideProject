//
//  eventShowViewController.swift
//  GoPlay
//
//  Created by Zonopact on 03/06/16.
//  Copyright © 2016 Zonopact. All rights reserved.
//

import UIKit

class dayShowViewController: ExtensionViewController,UITableViewDataSource,UITableViewDelegate {
    
    var tableArray:NSMutableArray = NSMutableArray()
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setBgImage()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButton() {
        let getNavigation:UINavigationController = self.slideMenuController()!.mainViewController as! UINavigationController
        getNavigation.popViewControllerAnimated(true)
    }

    
    // MARK: - Table View Delegates
    internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableArray.count;
    }
    internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       // let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: "cell")
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.backgroundColor = UIColor.clearColor()
        
        let getNoti:UILocalNotification = self.tableArray.objectAtIndex(indexPath.row) as! UILocalNotification
        
        let lable1:UILabel = cell.contentView.viewWithTag(1) as! UILabel
        lable1.text = getNoti.alertTitle
        
        let lable2:UILabel = cell.contentView.viewWithTag(2) as! UILabel
        let userInfo = getNoti.userInfo
        lable2.text = "Remind After: \(userInfo?["daysToShow"] as! String) days"

        let lable3:UILabel = cell.contentView.viewWithTag(3) as! UILabel
        lable3.text = getNoti.alertBody
        
        return cell
    }
    internal func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 170.0;
    }
    
    internal func tableView(tableView: UITableView, shouldHighlightRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    
    @IBAction func changeButton(sender: UIButton) {
        print("change");
    }
    
    @IBAction func deleteButton(sender: UIButton) {
        print("delete");
        
        let getCell:UITableViewCell = sender.superview?.superview as! UITableViewCell
        print("\(self.tableArray.objectAtIndex((self.tableView.indexPathForCell(getCell)?.row)!))");
        
        let notiFromArray: UILocalNotification = EventManager.sharedInstance.getPersistsNotificationsArray().objectAtIndex((self.tableView.indexPathForCell(getCell)?.row)!).objectForKey("value") as! UILocalNotification
        
        let dict: NSDictionary = EventManager.sharedInstance.getPersistsNotificationsArray().objectAtIndex((self.tableView.indexPathForCell(getCell)?.row)!) as! NSDictionary
        
        
        if (self.tableArray.containsObject(notiFromArray)) {
            EventManager.sharedInstance.deleteEventObject(dict)
            self.tableArray.removeObjectAtIndex((self.tableView.indexPathForCell(getCell)?.row)!)
            self.tableView.reloadData()
        } else {
            print("NOPE");
        }
        
        UIApplication.sharedApplication().cancelLocalNotification(notiFromArray)
    }
    
    @IBAction func shareButton(sender: UIButton) {
        print("share");
        
        let getCell:UITableViewCell = sender.superview?.superview as! UITableViewCell
        print("\(self.tableView.indexPathForCell(getCell)?.row)");
        
        let textOne = getCell.viewWithTag(1) as! UILabel
        let textTwo = getCell.viewWithTag(3) as! UILabel

        let objectsToShare = [textOne.text! , textTwo.text!]
        print(objectsToShare)
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.presentViewController(activityVC, animated: true, completion: nil)
    }
}
