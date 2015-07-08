//
//  AppDelegate.swift
//  NewShare
//
//  Created by Johnson Ejezie on 7/8/15.
//  Copyright (c) 2015 Johnson Ejezie. All rights reserved.
//

import UIKit
import OAuth2

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let uber_OAuth_Settings = [
        "client_id": "rRRoqwo6PL8HuRfweY09bX81bSd4pDwP",
        "client_secret": "CklSUJm3mGoBryN45PP68NQHps2RsJmGkV0BvBMt",
        "authorize_uri": "https://login.uber.com/oauth/authorize",
        "token_uri": "https://login.uber.com/oauth/token",
        "redirect_uris": ["NewShare://oauth/callback"],   // don't forget to register this scheme
        ] as OAuth2JSON
    var oauth: OAuth2CodeGrant!


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        oauth = OAuth2CodeGrant(settings: uber_OAuth_Settings)
        oauth.viewTitle = "Uber Login Service"      // optional
        oauth.verbose = true // For Logs
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject?) -> Bool {
        
        
        var splitUrl = url.absoluteString!.componentsSeparatedByString(":")
        
        if splitUrl[0] == ("newshare") {
        
        oauth.handleRedirectURL(url)
        
        return true
        }else {
            return GPPURLHandler.handleURL(url, sourceApplication: sourceApplication, annotation: annotation)
        }
    }


}

