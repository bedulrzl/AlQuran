//
//  AppDelegate.swift
//  AlQuran
//
//  Created by Aprizal on 30/4/20.
//  Copyright © 2020 Aprizal. All rights reserved.
//

import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let rootView = MainTabBarController()
      
       
        window?.rootViewController = rootView
        window?.makeKeyAndVisible()
        
//        nav.navigationBar.barTintColor = UIColor.darkGreen
//        nav.navigationBar.tintColor = UIColor.lightBrown
//        nav.navigationBar.titleTextAttributes =  [NSAttributedString.Key.foregroundColor: UIColor.lightBrown]
//        nav.navigationBar.isTranslucent = true

        return true
    }


}

