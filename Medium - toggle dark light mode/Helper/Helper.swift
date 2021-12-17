//
//  Helper.swift
//  UseYourWords
//
//  Created by James Tapping on 06/08/2021.
//

import Foundation
import AVFoundation
import UIKit

struct Helper {
    
    let defaults = UserDefaults.standard

    func currentTheme() -> Theme {
        
        let rawValue = defaults.string(forKey: "ThemeStateEnum") ?? "system"
        
        let currentTheme = Theme(rawValue: rawValue)
        
        return currentTheme!
    }
    
    func updateThemeState(themeChoice: Theme) {
        
        switch themeChoice {
            
        case .system:
            
            // Check the current system mode and change to it app wide
            
            if UIScreen.main.traitCollection.userInterfaceStyle == .dark {
                
                UserInterfaceStyleManager.shared.updateUserInterfaceStyle(true)
                
            } else {
                
                UserInterfaceStyleManager.shared.updateUserInterfaceStyle(false)
                
            }
            
        case .light:
            
            UserInterfaceStyleManager.shared.updateUserInterfaceStyle(false)
            
        case .dark:
            
            
            UserInterfaceStyleManager.shared.updateUserInterfaceStyle(true)
        }
        
        defaults.set(themeChoice.rawValue, forKey: "ThemeStateEnum")
        
     }
    
}


    


