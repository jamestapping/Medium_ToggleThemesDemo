//
//  MyTabBarController.swift
//  UseYourWords
//
//  Created by James Tapping on 24/10/2021.
//

import UIKit

class MyTabBarController: UITabBarController {
    
    var helper = Helper()

    override func viewDidLoad() {
        super.viewDidLoad()

        startObserving(&UserInterfaceStyleManager.shared)
        
        NotificationCenter.default.addObserver(self, selector: #selector(applicationDidBecomeActive), name: UIApplication.didBecomeActiveNotification, object: nil)
        
    }
    
    @objc func applicationDidBecomeActive() {
        
        helper.updateThemeState(themeChoice: helper.currentTheme())
        
        
    }
    
}
