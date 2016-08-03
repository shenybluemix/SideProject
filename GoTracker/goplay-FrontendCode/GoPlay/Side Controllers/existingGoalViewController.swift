//
//  existingGoalViewController.swift
//  GoPlay
//
//  Created by Zonopact on 17/05/16.
//  Copyright © 2016 Zonopact. All rights reserved.
//

import UIKit
import KGModal


class existingGoalViewController: ExtensionViewController,webServicesDelegates {
    
    var goalId:String = String()
    
    
    var goalNamePro:String = String()

    var predicateArray:NSMutableArray = NSMutableArray()
    var numberofTimes:Int = Int()
    
    @IBOutlet var percentage: UILabel!
    @IBOutlet var goalName: UILabel!
    @IBOutlet weak var calendarView: CVCalendarView!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var menuView: CVCalendarMenuView!
    
    var dateValue:NSDate = NSDate()

    var shouldShowDaysOut = true
    var animationFinished = true
    
    var selectedDay:DayView!
    var selectionSet = Set<DayView>()
    
    //Notification's Data
    var array:NSMutableArray?
    
    var dateArray:NSMutableArray = NSMutableArray()
    var tableArray:NSMutableArray = NSMutableArray()
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        calendarView.commitCalendarViewUpdate()
        menuView.commitMenuViewUpdate()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setBgImage()
        self.goalName.text = self.goalNamePro
        
        
        let notif:NSDictionary = EventManager.sharedInstance.getAPersistedLocalNotificationWithId(self.goalId)!
        
       
        let userinfo : NSDictionary =    (notif.objectForKey("value") as! UILocalNotification).userInfo!
        print(userinfo)
      //  let noofdays:String = userinfo.objectForKey("daysToShow") as! String
        let daysofSuccess:String = userinfo.objectForKey("daysofSuccess") as! String

        
        numberofTimes = Int(daysofSuccess)!
        
        self.percentage.text = daysofSuccess
        
        print(predicateArray)
    }
    
    override func viewWillAppear(animated: Bool) {
        print(EventManager.sharedInstance.getPersistsNotificationsArray())
        
        self.monthLabel.text = CVDate(date: NSDate()).globalDescription

        
//        if NSUserDefaults.standardUserDefaults().objectForKey(goalsArray) != nil {
//            for item in (NSUserDefaults.standardUserDefaults().objectForKey(goalsArray) as! NSArray) {
//                
//                print(item)
//                if "\(item.objectForKey("goal_id")!)" == self.goalId {
//                    let arraay:NSMutableArray = item.objectForKey("status")! as! NSMutableArray
//                    let predicate = NSPredicate(format: "status = 'done'")
//                    let predArray = NSMutableArray(array: arraay.filteredArrayUsingPredicate(predicate))
//                    
//                    for dictt in predArray {
//                        self.predicateArray.addObject(dictt.objectForKey("date")!)
//                    }
//                    print(self.predicateArray)
//                }
//            }
//        }
       
    }
    override func viewWillDisappear(animated: Bool) {
        
        print(EventManager.sharedInstance.getAPersistedLocalNotificationWithId(self.goalId))
        
        
        let notifDic:NSDictionary = EventManager.sharedInstance.getAPersistedLocalNotificationWithId(self.goalId)!
        
        
        let notification : UILocalNotification =   (notifDic.objectForKey("value") as! UILocalNotification)
        
      
        let userinfo : NSDictionary =    (notifDic.objectForKey("value") as! UILocalNotification).userInfo!
        let noofdays:String = userinfo.objectForKey("daysToShow") as! String
        let daysofSuccess:String = String(numberofTimes)

        EventManager.sharedInstance.deleteAPersistedLocalNotification(self.goalId)

        
        EventManager.sharedInstance.createNotification(notification.alertBody!, notiTitle: notification.alertTitle!, days: noofdays ,goalId: "\(self.goalId)",daysofSuccess: daysofSuccess)

        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    func deleteGoalLocally() -> Void {
        self.showAlert()
        
            }

    func showAlert() {
        let alertController = UIAlertController(title: "Are you sure?", message: nil, preferredStyle: .Alert)
        
        let defaultAction = UIAlertAction(title: "No", style: .Default, handler: nil)
        
        let callActionHandler = { (action:UIAlertAction!) -> Void in
          
            EventManager.sharedInstance.deleteAPersistedLocalNotification(self.goalId)
            let getNavigation:UINavigationController = self.slideMenuController()!.mainViewController as! UINavigationController
            getNavigation.popViewControllerAnimated(true)
 
        
        }
        
        
        let yesAction = UIAlertAction(title: "Yes", style: .Default, handler: callActionHandler)
       
        
        alertController.addAction(defaultAction)
        alertController.addAction(yesAction)


        
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDayEventSegue" {
            let destCtrl:dayShowViewController = segue.destinationViewController as! dayShowViewController
            destCtrl.tableArray = self.tableArray
        }
        
        if segue.identifier == "editGoalIden" {
            let destCtrl:addGoalViewController = segue.destinationViewController as! addGoalViewController
            destCtrl.isEditGoal = true
            destCtrl.goalID = self.goalId
        }
    }

    
    @IBAction func openSideMenu(sender: AnyObject)
    {
        self.slideMenuController()?.openLeft()
    }
    
    // MARK: - three buttons
    @IBAction func changes(sender: AnyObject) {
        print(goalId)
        self.performSegueWithIdentifier("editGoalIden", sender: nil)
    }
    
    @IBAction func deleteAction(sender: AnyObject) {
        
        self.deleteGoalLocally()
        
//        let deleteGoalString:String = deleteGoal + goalId
//        webservices.sharedInstance.delegate = self
//        webservices.sharedInstance.deleteDataFromServer(deleteGoalString)
        
    }
    
    @IBAction func share(sender: AnyObject) {
        print("Share Action")
        
        let textToShare = "Check out this website about it!"
        if let myWebsite = NSURL(string: "http://zonopact.com/") {
            let objectsToShare = [textToShare, myWebsite]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            
            activityVC.popoverPresentationController?.sourceView = sender as? UIView
            presentViewController(activityVC, animated: true, completion: nil)
        }
        
    }

    func responseFromWebServiceForGet(revDict: NSDictionary) {
        print(revDict)
        
        if (revDict.objectForKey("message") as! String) == "goal deleted successfuly" {
            
          self.deleteGoalLocally()
        
        }

    }

   
}


// MARK: - CVCalendarViewDelegate & CVCalendarMenuViewDelegate

extension existingGoalViewController: CVCalendarViewDelegate, CVCalendarMenuViewDelegate {
    
    /// Required method to implement!
    func presentationMode() -> CalendarMode {
        return .MonthView
    }
    
    /// Required method to implement!
    func firstWeekday() -> Weekday {
        return .Sunday
    }
    
    // MARK: Optional methods
    
    func shouldAutoSelectDayOnMonthChange() -> Bool {
        return false
    }
    
    func shouldShowWeekdaysOut() -> Bool {
        return shouldShowDaysOut
    }
    
    func shouldAnimateResizing() -> Bool {
        return true // Default value is true
    }
    
    func didSelectDayView(dayView: CVCalendarDayView, animationDidFinish: Bool) {
        print("\(dayView.date.commonDescription) is selected! mark it success full")
        
        if self.selectionSet.contains(dayView) {
           
            //Day Failure and Hit API
            
            let userId:String = webservices.sharedInstance.userid!
            
            let dateString = dayView.date.myApiFormat
            
            let jsonParms = ["goal_id":self.goalId,
                             "user_id":userId,
                             "date":dateString,
                             "status":"not_done"]
            
            print(jsonParms)
            
//            webservices.sharedInstance.delegate = self
//            webservices.sharedInstance.postDataToServer(jsonParms, url: updateDaySuccess)
//            
           self.selectionSet.remove(dayView)
            numberofTimes-=1;
            self.percentage.text = String( numberofTimes)
            
        } else {
            
            //Day Success and Hit API
            
            let userId:String = webservices.sharedInstance.userid!
            let dateString = dayView.date.myApiFormat
            
            let jsonParms = ["goal_id":self.goalId,
                             "user_id":userId,
                             "date":dateString,
                             "status":"done"]
            
            print(jsonParms)
            
//            webservices.sharedInstance.delegate = self
//            webservices.sharedInstance.postDataToServer(jsonParms, url: addDaySuccess)
            
            self.selectionSet.insert(dayView)
            numberofTimes+=1;

            self.percentage.text = String( numberofTimes)


        }
    }
    
    func responseFromWebServiceForPost(revDict: NSDictionary) {
        print(revDict)
        if (revDict.objectForKey("message") as! String) == "success added successfuly" {
            print("Add permanetly to array")
            return
        }
        
        if (revDict.objectForKey("message") as! String) == "goal not completed" {
            print("Delete permanetly to array")
            return
        }
    }
    
    func presentedDateUpdated(date: CVDate) {

        if monthLabel.text != date.globalDescription && self.animationFinished {
            let updatedMonthLabel = UILabel()
            updatedMonthLabel.textColor = monthLabel.textColor
            updatedMonthLabel.font = monthLabel.font
            updatedMonthLabel.textAlignment = .Center
            updatedMonthLabel.text = date.globalDescription
            updatedMonthLabel.sizeToFit()
            updatedMonthLabel.alpha = 0
            updatedMonthLabel.center = self.monthLabel.center
            
            let offset = CGFloat(48)
            updatedMonthLabel.transform = CGAffineTransformMakeTranslation(0, offset)
            updatedMonthLabel.transform = CGAffineTransformMakeScale(1, 0.1)
            
            UIView.animateWithDuration(0.35, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                self.animationFinished = false
                self.monthLabel.transform = CGAffineTransformMakeTranslation(0, -offset)
                self.monthLabel.transform = CGAffineTransformMakeScale(1, 0.1)
                self.monthLabel.alpha = 0
                
                updatedMonthLabel.alpha = 1
                updatedMonthLabel.transform = CGAffineTransformIdentity
                
            }) { _ in
                
                self.animationFinished = true
                self.monthLabel.frame = updatedMonthLabel.frame
                self.monthLabel.text = updatedMonthLabel.text
                self.monthLabel.transform = CGAffineTransformIdentity
                self.monthLabel.alpha = 1
                updatedMonthLabel.removeFromSuperview()
            }
            self.view.insertSubview(updatedMonthLabel, aboveSubview: self.monthLabel)
        }
    }
    
    func topMarker(shouldDisplayOnDayView dayView: CVCalendarDayView) -> Bool {
        
        if let _ = dayView.date  {
            if self.predicateArray.containsObject(dayView.date.myApiFormat) {
                self.selectionSet.insert(dayView)
                dayView.calendarView.coordinator.animator.animateSelectionOnDayView(dayView)
            }
        }
       
        return true
    }
    
    func dotMarker(shouldShowOnDayView dayView: CVCalendarDayView) -> Bool {
        let day = dayView.date.day
        let randomDay = Int(arc4random_uniform(31))
        if day == randomDay {
            return false
        }
        return false
    }
    
    func dotMarker(colorOnDayView dayView: CVCalendarDayView) -> [UIColor] {
        
        let red = CGFloat(arc4random_uniform(600) / 255)
        let green = CGFloat(arc4random_uniform(600) / 255)
        let blue = CGFloat(arc4random_uniform(600) / 255)
        
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1)
        
        let numberOfDots = Int(arc4random_uniform(3) + 1)
        switch(numberOfDots) {
        case 2:
            return [color, color]
        case 3:
            return [color, color, color]
        default:
            return [color]
        }
    }
    
    func dotMarker(shouldMoveOnHighlightingOnDayView dayView: CVCalendarDayView) -> Bool {
        return true
    }
    
    func dotMarker(sizeOnDayView dayView: DayView) -> CGFloat {
        return 12
    }
    
    
    func weekdaySymbolType() -> WeekdaySymbolType {
        return .Short
    }
    
    func selectionViewPath() -> ((CGRect) -> (UIBezierPath)) {
        
        return { UIBezierPath(rect: CGRectMake(0, 0, $0.width, $0.height)) }
    }
    
    func shouldShowCustomSingleSelection() -> Bool {
        return false
    }
    
    func preliminaryView(viewOnDayView dayView: DayView) -> UIView {
        let circleView = CVAuxiliaryView(dayView: dayView, rect: dayView.bounds, shape: CVShape.Circle)
        circleView.fillColor = .colorFromCode(0xCCCCCC)
        return circleView
    }
    
    func preliminaryView(shouldDisplayOnDayView dayView: DayView) -> Bool {
        if (dayView.isCurrentDay) {
            return true
        }
        return false
    }
    
    
    func supplementaryView(viewOnDayView dayView: DayView) -> UIView {
        let π = M_PI
        
        let ringSpacing: CGFloat = 3.0
        let ringInsetWidth: CGFloat = 1.0
        let ringVerticalOffset: CGFloat = 1.0
        var ringLayer: CAShapeLayer!
        let ringLineWidth: CGFloat = 4.0
        let ringLineColour: UIColor = .blueColor()
        
        let newView = UIView(frame: dayView.bounds)
        
        let diameter: CGFloat = (newView.bounds.width) - ringSpacing
        let radius: CGFloat = diameter / 2.0
        
        let rect = CGRectMake(newView.frame.midX-radius, newView.frame.midY-radius-ringVerticalOffset, diameter, diameter)
        
        ringLayer = CAShapeLayer()
        newView.layer.addSublayer(ringLayer)
        
        ringLayer.fillColor = nil
        ringLayer.lineWidth = ringLineWidth
        ringLayer.strokeColor = ringLineColour.CGColor
        
        let ringLineWidthInset: CGFloat = CGFloat(ringLineWidth/2.0) + ringInsetWidth
        let ringRect: CGRect = CGRectInset(rect, ringLineWidthInset, ringLineWidthInset)
        let centrePoint: CGPoint = CGPointMake(ringRect.midX, ringRect.midY)
        let startAngle: CGFloat = CGFloat(-π/2.0)
        let endAngle: CGFloat = CGFloat(π * 2.0) + startAngle
        let ringPath: UIBezierPath = UIBezierPath(arcCenter: centrePoint, radius: ringRect.width/2.0, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        ringLayer.path = ringPath.CGPath
        ringLayer.frame = newView.layer.bounds
        
        return newView
    }
    
    func supplementaryView(shouldDisplayOnDayView dayView: DayView) -> Bool {
        if (Int(arc4random_uniform(3)) == 1) {
            return false
        }
        
        return false
    }
}


// MARK: - CVCalendarViewAppearanceDelegate

extension existingGoalViewController: CVCalendarViewAppearanceDelegate {
    func dayLabelPresentWeekdayInitallyBold() -> Bool {
        return false
    }
    
    func spaceBetweenDayViews() -> CGFloat {
        return 1
    }
}

// MARK: - IB Actions
extension existingGoalViewController {
    
    @IBAction func loadPrevious(sender: AnyObject) {
        calendarView.loadPreviousView()
    }
    
    
    @IBAction func loadNext(sender: AnyObject) {
        calendarView.loadNextView()
    }
}

// MARK: - Convenience API Demo
extension existingGoalViewController {
    func toggleMonthViewWithMonthOffset(offset: Int) {

    }
    
    func didShowNextMonthView(date: NSDate)
    {
       let components = Manager.componentsForDate(date)
    }
    
    
    func didShowPreviousMonthView(date: NSDate)
    {
       let components = Manager.componentsForDate(date)
    }
    
}