//
//  AppDelegate.swift
//  LoginTest
//
//  Created by SIMA on 2017. 11. 3..
//  Copyright © 2017년 SimaDev. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import Firebase
import GoogleMaps
import GooglePlaces

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        FirebaseApp.configure()
        GMSServices.provideAPIKey("AIzaSyBqQAziAnH4caGsugSMWaDD-Mp95_gPiMw")
        GMSPlacesClient.provideAPIKey("AIzaSyBqQAziAnH4caGsugSMWaDD-Mp95_gPiMw")
        
        
        return true
    }
    
    open func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
//        BOOL handled = [[FBSDKApplicationDelegate sharedInstance] application:application
//            openURL:url
//            sourceApplication:options[UIApplicationOpenURLOptionsSourceApplicationKey]
//            annotation:options[UIApplicationOpenURLOptionsAnnotationKey]
        let handled = FBSDKApplicationDelegate.sharedInstance().application(app,
                                                                            open: url,
                                                                            sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as! String,
                                                                            annotation: options[UIApplicationOpenURLOptionsKey.annotation])
        
        return handled
        
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        FBSDKAppEvents.activateApp()
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }


}

