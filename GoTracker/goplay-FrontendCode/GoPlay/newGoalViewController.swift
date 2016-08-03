//
//  newGoalViewController.swift
//  GoPlay
//
//  Created by Zonopact on 17/05/16.
//  Copyright © 2016 Zonopact. All rights reserved.
//

import UIKit


class newGoalViewController: ExtensionViewController {
    
    var selectedCategory:String = String();
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setBgImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let newCtrl:addGoalViewController = segue.destinationViewController as! addGoalViewController
        newCtrl.addToCategory = self.selectedCategory
    }


    
   @IBAction func onButtonClickAction(sender: UIButton)
    {
        print(sender.titleLabel!.text!)
        
        self.selectedCategory = sender.titleLabel!.text!
        self.performSegueWithIdentifier("addGoalSegue", sender: nil)
    }
    
    
    
    @IBAction func onSideMenuAction(sender: UIButton)
    {
        self.slideMenuController()?.openLeft()
    }
    
}
