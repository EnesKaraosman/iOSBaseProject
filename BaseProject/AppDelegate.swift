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
/// SwiftyJSON ✅
/// Codable Protocol ✅

// Reactive
/// Rx Extensions (versions) ✅
/// Moya: Consider using enumeration cases for api (service interfaces) ref: ios-base-swift-master/Services ❌⁉️

// Tracking network activities
///  External app: Bagel ✅
///  Internal pod: AlamofireNetworkActivityLogger ✅

// Settings Bundle Environment switching like Production, Development ✅

/********************************************************************/

// MARK: - Clean Architecture

// Design Pattern
/// MVVM ✅
/// MVP  ⁉️
/// VIPER ⁉️

// Coordinator
/// XCoordinator ✅ https://github.com/quickbirdstudios/XCoordinator

// Dependency Injection
/// Resolver: https://github.com/hmlongco/Resolver

/********************************************************************/

// MARK: - Storage
/// UserDefaults (propertyWrapper) ✅ (Recomended max. limit is 1MB)
/// Databases (CoreData, Realm)
/// Keychain (OAuth token, User’s sensitive, secret data) https://github.com/kishikawakatsumi/KeychainAccess
/// Files on disk (Images, videos, PDF..)

/********************************************************************/

// MARK: - Helper, Util
// Logger (May be used with analitycs services) ✅
/// Localization ✅
// Use "".localized() any string you want to localize. Then you can follow helper scripts.

// https://github.com/marmelroy/Localize-Swift
// (This will print the collected strings in the terminal. Select and copy to your default Localizable.strings.)

// https://github.com/JiriTrecak/Laurine
// (Scans your Localizable.strings then generates Helper struct to use, Localizations.MainTitle)

// Styler (TextStyle, FontManager)
// Reusable (Identifiable)
// Loading Indicator integration ✅

/// Common & Extensions

/// Extensions
// https://github.com/SwifterSwift/SwifterSwift
// A handy collection of more than 500 native Swift extensions to boost your productivity.

/// Initial
// What's new in this version: https://github.com/SvenTiigi/WhatsNewKit

// Date - Helper https://github.com/malcommac/SwiftDate
// Bottom bar vc, PagerStripVC
// Constants
// Configuration File (May include all primary fonts, colors, urls.. ?) ✅
// Permissions (https://github.com/ivanvorobei/SPPermissions)
// SwiftLint
// ThemeManager
// Plist manager
// Pagination (Serviced based & UIBased) view nextable protocol in bookmark project
// Onboarding: https://github.com/Ramotion/paper-onboarding
// Push Notification Manager

/// BaseClasses, BaseComponents (BaseViews, Dark mode support)
/// Component Factory (UI components)

// MARK: - Analytics
/// In case you want to use multiple provider, consider abstraction via https://github.com/devxoul/Umbrella
/// AmplitudeProvider (Amplitude-iOS)
/// AnswersProvider (Answers)
/// AppboyProvider (Appboy-iOS-SDK)
/// AppsFlyerProvider (AppsFlyerFramework)
/// FirebaseProvider (Firebase/Analytics)
/// FlurryProvider (Flurry-iOS-SDK/FabricSDK)
/// LocalyticsProvider (Localytics)
/// MixpanelProvider (Mixpanel)

/********************************************************************/

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    private let router = AppCoordinator().strongRouter

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.setupWindow()
        
        self.setupNetworkEnvironment()

        self.handleNetworkActivityLogging()
        Bagel.start()
                
        Connectivity.shared.listener = { state in
            guard let nv = self.window?.rootViewController as? UINavigationController else { return }
            nv.viewControllers.first?.view.makeToast(Connectivity.shared.isConnectedToInternet ? "Connected to Internet": "Connection Lost")
        }
        
        // If initialization gets crowded here, consider using LibsManager & Configuration in a seperate place
        
        return true
    }
    
    private func setupWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        router.setRoot(for: window!)
    }
    
    private func setupNetworkEnvironment() {
        let baseUrl = Configurations.Environment.selected.url
        Log.i(baseUrl)
        APIClient.instance.environment = NetworkEnvironment(baseUrl: baseUrl)
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
