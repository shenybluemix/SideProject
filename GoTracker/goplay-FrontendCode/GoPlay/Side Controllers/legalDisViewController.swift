//
//  legalDisViewController.swift
//  GoPlay
//
//  Created by Zonopact on 17/05/16.
//  Copyright © 2016 Zonopact. All rights reserved.
//

import UIKit

class legalDisViewController: ExtensionViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setBgImage()
  
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
    
    @IBAction func openSideMenu(sender: AnyObject) {
        self.slideMenuController()?.openLeft()
    }
    

}
