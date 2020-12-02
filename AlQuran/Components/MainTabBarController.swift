//
//  MainTabBarController.swift
//  AlQuran
//
//  Created by Aprizal on 12/5/20.
//  Copyright © 2020 Aprizal. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpTabBar()
    }
    
    func setUpTabBar(){
        let HomeController =  generateNavigationBar(controller: HomeViewController())
        HomeController.tabBarItem = UITabBarItem(title: "Jadwal", image: #imageLiteral(resourceName: "icons8-present"), tag: 0)
        
       
        let SuratController = generateNavigationBar(controller: SuratViewController())
        SuratController.tabBarItem = UITabBarItem(title: "AlQuran", image: #imageLiteral(resourceName: "icons8-literature"), selectedImage: .none)
        
        viewControllers = [HomeController, SuratController]
        
       
        UITabBar.appearance().tintColor = UIColor.lightBrown
        tabBar.barTintColor = UIColor.darkGreen
        
    }
    

    func generateNavigationBar(controller: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: controller)
        nav.navigationBar.barTintColor = UIColor.darkGreen
              nav.navigationBar.tintColor = UIColor.lightBrown
              nav.navigationBar.titleTextAttributes =  [NSAttributedString.Key.foregroundColor: UIColor.lightBrown]
              nav.navigationBar.isTranslucent = true
        return nav
    }

}
