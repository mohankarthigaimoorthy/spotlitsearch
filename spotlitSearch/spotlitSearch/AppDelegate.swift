//
//  AppDelegate.swift
//  spotlitSearch
//
//  Created by Imcrinox Mac on 25/12/1444 AH.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
   
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([Any]?) -> Void) -> Bool {
        let viewController = (window?.rootViewController as! UINavigationController).viewControllers[0] as! ViewController
        viewController.restoreUserActivityState(userActivity)
        
        return true
    }
}

