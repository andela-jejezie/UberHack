//
//  ProfileViewController.swift
//  NewShare
//
//  Created by Johnson Ejezie on 7/8/15.
//  Copyright (c) 2015 Johnson Ejezie. All rights reserved.
//

import UIKit

import AddressBook
import MediaPlayer
import AssetsLibrary
import CoreLocation
import CoreMotion

class ProfileViewController: UIViewController, GPPSignInDelegate {
    
     var signIn: GPPSignIn?

    override func viewDidLoad() {
        super.viewDidLoad()
        
               // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func finishedWithAuth(auth: GTMOAuth2Authentication!, error: NSError!) {
        if (error != nil) {
            println(auth)
        }else {
            println(error)
        }
    }
    
    func didDisconnectWithError(error: NSError!) {
        if (error != nil) {
            
        }
    }
    
    
    @IBAction func importCalendar() {
        
        signIn = GPPSignIn.sharedInstance()
        signIn?.shouldFetchGooglePlusUser = true
        signIn?.clientID = "453264479059-g17p1bns4en304mmmo5l4qv1eqq1fp9u.apps.googleusercontent.com"
        signIn?.scopes = [kGTLAuthScopePlusMe]
        signIn?.delegate = self
        signIn?.authenticate()
        

    }
    
    
}
