//
//  SideViewController.swift
//  GoPlay
//
//  Created by Zonopact on 17/05/16.
//  Copyright © 2016 Zonopact. All rights reserved.
//

import UIKit
import MessageUI
import SVProgressHUD

class SideViewController: UIViewController,MFMailComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func newGoals(sender: AnyObject) {
        
        self.moveToController((self.storyboard?.instantiateViewControllerWithIdentifier("newGoalidentifier"))!)
    }
    

    @IBAction func trackGoals(sender: AnyObject)
    {
        let getNavigation:UINavigationController = self.slideMenuController()!.mainViewController as! UINavigationController
        getNavigation.popToRootViewControllerAnimated(false)
        self.slideMenuController()?.closeLeft()
    }
    
    @IBAction func mission(sender: AnyObject)
    {
   self.moveToController((self.storyboard?.instantiateViewControllerWithIdentifier("missionControllerIdentifier"))!)
    }
    
    @IBAction func feedBack(sender: AnyObject)
    {
        self.slideMenuController()?.closeLeft()
        
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.presentViewController(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
        
        
    }
    
    @IBAction func share(sender: AnyObject)
    {
        self.slideMenuController()?.closeLeft()
        
        let textToShare = "Swift is awesome!  Check out this website about it!"
        
        if let myWebsite = NSURL(string: "http://www.codingexplorer.com/") {
            let objectsToShare = [textToShare, myWebsite]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            
            activityVC.popoverPresentationController?.sourceView = sender as? UIView
            self.presentViewController(activityVC, animated: true, completion: nil)
        }
        
    }
    
    
    @IBAction func legal(sender: AnyObject)
    {
    self.moveToController((self.storyboard?.instantiateViewControllerWithIdentifier("legalControllerIdentifier"))!)
    }
    
    
    
    //Navigation from center view controller
    func moveToController(ctrl: UIViewController)
    {
        let getNavigation:UINavigationController = self.slideMenuController()!.mainViewController as! UINavigationController
        
        for getCtrls in getNavigation.viewControllers {
            
            if ctrl.isKindOfClass(getCtrls.classForCoder)
            {
              getNavigation.viewControllers.removeAtIndex(getNavigation.viewControllers.indexOf(getCtrls)!)
              break
            }
        }
        getNavigation.pushViewController(ctrl, animated: false)
        self.slideMenuController()?.closeLeft()
        
        print(getNavigation.viewControllers)
    }
    
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        mailComposerVC.setToRecipients(["someone@somewhere.com"])
        mailComposerVC.setSubject("Share your experience, we want to provide a better service")
        mailComposerVC.setMessageBody("", isHTML: false)
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        SVProgressHUD.showErrorWithStatus("Failed to send Email!")
    }
    
    // MARK: MFMailComposeViewControllerDelegate Method
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}
