//
//  AppDelegate.swift
//  BaseProject
//
//  Created by Enes Karaosman on 20.09.2019.
//  Copyright © 2019 Enes Karaosman. All rights reserved.
//

import UIKit
import Bagel

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.setupWindow()
        
        Bagel.start()
        
        APIClient.instance.environment = NetworkEnvironment(baseUrl: "https://5da476a3a6593f001407a7af.mockapi.io/")
        
        return true
    }
    
    private func setupWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: ExampleViewController())
        window?.makeKeyAndVisible()
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

}

