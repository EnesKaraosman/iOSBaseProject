//
//  UIApplication+Extensions.swift
//  BaseProject
//
//  Created by Enes Karaosman on 10.01.2020.
//  Copyright © 2020 Enes Karaosman. All rights reserved.
//

import UIKit

extension UIApplication {
    
    static var applicationVersionNumber: String {
        return Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
    }
    
    static var applicationBuildNumber: String {
        return Bundle.main.infoDictionary!["CFBundleVersion"] as! String
    }
    
    static var bundleIdentifier: String {
        return Bundle.main.bundleIdentifier!
    }
    
}
