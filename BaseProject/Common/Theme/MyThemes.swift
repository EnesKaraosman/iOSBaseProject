//
//  MyThemes.swift
//  BaseProject
//
//  Created by Enes Karaosman on 3.03.2020.
//  Copyright © 2020 Enes Karaosman. All rights reserved.
//

import Foundation
import SwiftTheme

private let lastThemeIndexKey = "lastedThemeIndex"
private let defaults = UserDefaults.standard

enum MyThemes: Int, CaseIterable {
    
    case light = 0
    case dark  = 1
    
    var title: String {
        switch self {
        case .light:
            return "Light".localized()
        case .dark:
            return "Dark".localized()
        }
    }
    
    static var current: MyThemes {
        return MyThemes(rawValue: ThemeManager.currentThemeIndex)!
    }
    
    // MARK: - Switch Theme
    
    static func switchTo(theme: MyThemes) {
        ThemeManager.setTheme(index: theme.rawValue)
        saveLastTheme()
    }
    
    static func isDark() -> Bool {
        return current == .dark
    }
    
    // MARK: - Save & Restore
    
    static func restoreLastTheme() {
        let lastThemeIndex = defaults.value(forKey: lastThemeIndexKey) as? Int ?? MyThemes.light.rawValue
        switchTo(theme: MyThemes(rawValue: lastThemeIndex)!)
    }
    
    static func saveLastTheme() {
        defaults.set(ThemeManager.currentThemeIndex, forKey: lastThemeIndexKey)
    }
    
}
