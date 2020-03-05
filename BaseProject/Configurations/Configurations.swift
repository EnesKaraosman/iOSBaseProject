//
//  Configurations.swift
//  BaseProject
//
//  Created by Enes Karaosman on 10.01.2020.
//  Copyright © 2020 Enes Karaosman. All rights reserved.
//

import UIKit

struct Configurations {
    struct Fonts {
        @KeyValueStorage("Preferred_Font", defaultValue: FontFamily.raleway)
        static var primary: FontFamily
    }
    struct Network {
        static let logNetworkActivity = true
    }
    enum Environment: String {
        // If you add new cases,
        // make sure to add to Settings.bundle as well, if you want it to be configurable
        case production
        case development
        
        var url: String {
            switch self {
            case .development:
                return "https://5da476a3a6593f001407a7af.mockapi.io/"
            case .production:
                return "https://5da476a3a6593f001407a7af.mockapi.io/"
            }
        }
        
        static var selected: Configurations.Environment {
            // Reads from Settings.bundle
            let defaultValue = Configurations.Environment.production
            if let environment = UserDefaults.standard.string(forKey: "network_environment") {
                return Configurations.Environment(rawValue: environment) ?? defaultValue
            }
            return defaultValue
            // If you want to ignore Settings.bundle, here return just what you want.
        }
        
    }
}
