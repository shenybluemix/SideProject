//
//  ContainerViewController.swift
//  GoPlay
//
//  Created by Zonopact on 17/05/16.
//  Copyright © 2016 Zonopact. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift


class ContainerViewController: SlideMenuController {

    
    
    
    override func awakeFromNib() {
        if let controller = self.storyboard?.instantiateViewControllerWithIdentifier("centerController") {
            self.mainViewController = controller
        }
        if let controller = self.storyboard?.instantiateViewControllerWithIdentifier("sideMenu") {
            self.leftViewController = controller
        }
        super.awakeFromNib()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
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
    
}
