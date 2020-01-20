//
//  AppDelegate.swift
//  BaseProject
//
//  Created by Enes Karaosman on 20.09.2019.
//  Copyright © 2019 Enes Karaosman. All rights reserved.
//

import UIKit
import AlamofireNetworkActivityLogger
import Bagel

// MARK: TODO

// MARK: - Network

// Parsing
/// ObjectMapper, SwiftyJSON ✅
/// Codable Protocol ❌

// Reactive
/// Rx Extensions (versions) ✅
/// Moya: Consider using enumeration cases for api (service interfaces) ref: ios-base-swift-master/Services ❌⁉️

// Tracking network activities
///  External app: Bagel ✅
///  Internal pod: AlamofireNetworkActivityLogger ✅

// Environment switching like PROD, PREPROD, TEST

/********************************************************************/

// MARK: - Clean Architecture

// Design Pattern
/// MVVM ✅
/// MVP  ⁉️

// Coordinator
/// XCoordinator for presenting ViewController (consider bottom popup to reflect iOS 13's default behaviour)

/********************************************************************/

// MARK: - Database
/// UserDefaults (propertyWrapper) ✅
/// CoreData ⁉️
/// Realm    ⁉️

/********************************************************************/

// MARK: - Helper, Util
// Logger (May be used with analitycs services) ✅
// Localization ✅ (Consider using SwiftGen, autogenerated localization strings https://github.com/SwiftGen/SwiftGen)
// Styler (TextStyle, FontManager)
// Reusable (Identifiable)
// Loading Indicator integration ✅
// Extensions
// Bottom bar vc, PagerStripVC
// Constants
// Configuration File (May include all primary fonts, colors, urls.. ?) ✅
// Permissions (https://github.com/ivanvorobei/SPPermissions)
// SwiftLint
// ThemeManager
// Plist manager

/// BaseClasses, BaseComponents (BaseViews, Dark mode support)
/// Component Factory (UI components)

// MARK: - Analytics

/// Crahslytics, Fabric ?

/********************************************************************/

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.setupWindow()
        
        APIClient.instance.environment = NetworkEnvironment(baseUrl: "https://5da476a3a6593f001407a7af.mockapi.io/")

        self.handleNetworkActivityLogging()
        Bagel.start()
                
        Connectivity.shared.listener = { state in
            guard let nv = self.window?.rootViewController as? UINavigationController else { return }
            nv.viewControllers.first?.view.makeToast(Connectivity.shared.isConnectedToInternet ? "Connected to Internet": "Connection Lost")
        }
        
        return true
    }
    
    private func setupWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: ExampleViewController())
        window?.makeKeyAndVisible()
    }
    
    private func handleNetworkActivityLogging() {
        #if DEBUG
        if Configurations.Network.logNetworkActivity {
            NetworkActivityLogger.shared.level = .debug
            NetworkActivityLogger.shared.startLogging()
        }
        #endif
    }

}
