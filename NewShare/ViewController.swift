//
//  ViewController.swift
//  NewShare
//
//  Created by Johnson Ejezie on 7/8/15.
//  Copyright (c) 2015 Johnson Ejezie. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
   
    
    
    @IBAction func login() {
        
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let url = appDelegate.oauth.authorizeURL()
        UIApplication.sharedApplication().openURL(url)
        appDelegate.oauth.onAuthorize = { parameters in
            println("Did authorize with parameters: \(parameters)")
            
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

