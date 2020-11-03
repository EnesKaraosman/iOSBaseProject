//
//  AppDelegate.swift
//  BaseProject
//
//  Created by Enes Karaosman on 20.09.2019.
//  Copyright © 2019 Enes Karaosman. All rights reserved.
//

import UIKit
import EKNetworkModule

// Common & Extensions

/// Extensions
// https://github.com/SwifterSwift/SwifterSwift
// A handy collection of more than 500 native Swift extensions to boost your productivity.

/// Initial
// What's new in this version: https://github.com/SvenTiigi/WhatsNewKit

// Date - Helper https://github.com/malcommac/SwiftDate
// Bottom bar vc, PagerStripVC
// Constants
// Permissions (https://github.com/ivanvorobei/SPPermissions)
// Plist manager
// Pagination (Serviced based & UIBased) view nextable protocol in bookmark project
// Onboarding: https://github.com/Ramotion/paper-onboarding
// Push Notification Manager
// Icons: https://github.com/ranesr/SwiftIcons

/********************************************************************/

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    private let router = AppCoordinator().strongRouter
    
    var features: [UIApplicationDelegate] = [
        Connectivity.shared,
        NetworkLogger.shared
    ]

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.setupWindow()
        
        self.setupNetworkEnvironment()
        
        features.forEach {
            _ = $0.application?(application, didFinishLaunchingWithOptions: launchOptions)
            // If initialization gets crowded here, clean up :)
            // https://medium.com/@kennethpoon/newbies-journey-on-cleaning-up-the-massive-appdelegate-comic-style-94008075e51d
        }

        return true
    }
    
}

extension AppDelegate {
    
    private func setupWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        router.setRoot(for: window!)
    }
    
    private func setupNetworkEnvironment() {
        let baseUrl = Configurations.Environment.selected.url
        Log.i(baseUrl)
        EKAPIClient.shared.networkEnvironment = EKNetworkEnvironment(baseUrl: baseUrl)
    }

}
