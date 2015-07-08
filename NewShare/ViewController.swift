//
//  ViewController.swift
//  NewShare
//
//  Created by Johnson Ejezie on 7/8/15.
//  Copyright (c) 2015 Johnson Ejezie. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class ViewController: UIViewController {
    
   
    
    
    @IBAction func login() {
        
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let url = appDelegate.oauth.authorizeURL()
        UIApplication.sharedApplication().openURL(url)
        appDelegate.oauth.onAuthorize = { parameters in
//            println("Did authorize with parameters: \(parameters)")
            let accessToken:String = parameters["access_token"] as! String
            println("access_token\(accessToken)")
            request(.GET, "https://andelahack.herokuapp.com/uber/callback?code=" + accessToken, encoding: .JSON)
            .responseJSON {(request, response, data, error) in
                println(request)
                println(data)
                println(error)
            }
            
//            self.navigationController?.pushViewController(self.PersonalDriverUber_VC, animated: true)
            //On Authorization Goto another ViewController using pushViewController of navigationcontroller Method
            self.performSegueWithIdentifier("profilePage", sender: nil)
            
        }
        appDelegate.oauth.onFailure = { error in        // `error` is nil on cancel
            if nil != error {
                println("Authorization went wrong: \(error!.localizedDescription)")
            }
        }
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
    }




}

