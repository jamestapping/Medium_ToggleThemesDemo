//
//  SettingsViewController.swift
//  Medium - toggle dark light mode
//
//  Created by James Tapping on 17/12/2021.
//

import UIKit

enum Theme:String {
    
    case system
    case light
    case dark
}

class SettingsViewController: UIViewController {

    var helper = Helper()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the correct setting in the UI when starting
        
        let rawValue = defaults.string(forKey: "ThemeStateEnum") ?? "system"
        
        let currentTheme = Theme(rawValue: rawValue)
        
        switch currentTheme {
            
        case .system:
            
            themeChoice.selectedSegmentIndex = 0
            
        case .light:
            
            themeChoice.selectedSegmentIndex = 1
            
        case .dark:
            
            themeChoice.selectedSegmentIndex = 2
        
        default:
            
            break
        }
        
    }
    
    @IBOutlet weak var themeChoice: UISegmentedControl!
    
    @IBAction func themeChoiceDidChange(_ sender: UISegmentedControl) {
        
        switch themeChoice.selectedSegmentIndex {
            
        case 0:
            
            helper.updateThemeState(themeChoice: .system)
        
        case 1:
            
            helper.updateThemeState(themeChoice: .light)
    
        case 2:
            
            helper.updateThemeState(themeChoice: .dark)

        default:
            break
        }
        
    }
}
