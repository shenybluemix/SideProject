//
//  ExtensionViewController.swift
//  GoPlay
//
//  Created by Zonopact on 01/06/16.
//  Copyright © 2016 Zonopact. All rights reserved.
//

import UIKit

class ExtensionViewController: UIViewController {

}

//Extention of a basic View Controller Set Bg Image
extension ExtensionViewController
{
    func setBgImage() {
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "background")?.drawInRect(self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
    }
}