//
//  AppDelegate.swift
//  DZ8
//
//  Created by Kristina Kudinova on 12.09.2020.
//  Copyright © 2020 Kristina Kudinova. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:
        [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let launchedBefore = UserDefaults.standard.bool(forKey: "hasLaunched")
        let launchStoryboard = UIStoryboard(name: "Onboarding", bundle: nil)
        let mainStoryboard = UIStoryboard (name: "Main", bundle: nil)
        var vc: UIViewController
        
        if launchedBefore {
            vc = mainStoryboard.instantiateInitialViewController()!
        } else {
            vc = launchStoryboard.instantiateViewController(withIdentifier: "PageViewController")
        }
        
        UserDefaults.standard.set(true, forKey: "hasLaunched")
        self.window?.rootViewController = vc
        self.window?.makeKeyAndVisible()
        
        return true
    }
}


