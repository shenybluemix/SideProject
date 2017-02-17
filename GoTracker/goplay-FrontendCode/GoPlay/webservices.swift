//
//  webservices.swift
//  Guru Guides
//
//  Created by WorksDelight on 17/06/16.
//  Copyright © 2016 Digital Guru Publishing. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SVProgressHUD


@objc

protocol webServicesDelegates {
    
    optional func responseFromWebServiceForPost(revDict: NSDictionary)
    optional func responseFromWebServiceForGet(revDict: NSDictionary)

}



class webservices: NSObject {
    
    
    
    var delegate: webServicesDelegates? = nil
    var userid: String?
    
    class var sharedInstance: webservices {
        struct Static {
            static var instance: webservices?
            static var token: dispatch_once_t = 0
        }
        dispatch_once(&Static.token) {
            Static.instance = webservices()
        }
        return Static.instance!
    }
    
    
    
    func postDataToServer(parms: [String: AnyObject] , url: String) {
        
        SVProgressHUD.show()
        
        
        
        Alamofire.request(.POST, baseurl + url, parameters: parms)
            .responseJSON
            {response in
                print("REQUEST: \(response.request)")
                print("RESPONSE: \(response.response)")
                if String(response.result) == "SUCCESS"{
                    
                    if let JSON = response.result.value
                    {
                        // print("JSON: \(JSON)")
                        SVProgressHUD.dismiss()
                        if JSON.isKindOfClass(NSDictionary)
                        {
                            print("JSON: \(JSON)")
                            self.delegate?.responseFromWebServiceForPost!(JSON as! NSDictionary)
                        }
                    }

                }
        }
 
        
        
//        let manager = Alamofire.Manager.sharedInstance
//        manager.session.configuration.HTTPAdditionalHeaders = [
//            "Content-Type": "application/json"
//        ]
//
//
//        Alamofire.request(.POST, baseurl+url,
//            parameters: parms ,encoding: .JSON )
//            .responseJSON { response in
//                
//                if let JSON = response.result.value
//                {
//                   // print("JSON: \(JSON)")
//                    SVProgressHUD.dismiss()
//                    
//                    if JSON.isKindOfClass(NSDictionary) {
//                        self.delegate?.responseFromWebServiceForPost!(JSON as! NSDictionary)
//                    }
//                }
//         }
//        
        
     }
    
    
    
    func getDataFromServer(url: String) {
        
        SVProgressHUD.show()
        
        /**
        Alamofire.request(.GET, "https://httpbin.org/get", parameters: ["foo": "bar"])
            .responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                    
                    SVProgressHUD.dismiss()
                }
        }
        **/
        
        
        Alamofire.request(.GET, "https://localhost:8443/goplay/get?id=1",
            parameters: nil)
            .responseJSON {
                
                response in
                
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                if let JSON = response.result.value
                {
                    print("JSON: \(JSON)")
                    
                    SVProgressHUD.dismiss()
                    
                    if JSON.isKindOfClass(NSDictionary)
                    {
                        self.delegate?.responseFromWebServiceForGet!(JSON as! NSDictionary)
                    }
                }
        }

      
    }
    
    
    
    //Delete Func 
    func deleteDataFromServer(url: String) {
        SVProgressHUD.show()
        
        Alamofire.request(.DELETE, baseurl + url,
            parameters: nil ,encoding: .JSON)
            .responseJSON { response in
                
                if let JSON = response.result.value
                {
                   //  print("JSON: \(JSON)")
                    
                    SVProgressHUD.dismiss()
                    
                    if JSON.isKindOfClass(NSDictionary)
                    {
                        self.delegate?.responseFromWebServiceForGet!(JSON as! NSDictionary)
                    }
                }
        }
        
    }

}