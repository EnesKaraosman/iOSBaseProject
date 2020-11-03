//
//  NetworkLogger.swift
//  BaseProject
//
//  Created by Enes Karaosman on 3.11.2020.
//  Copyright © 2020 Enes Karaosman. All rights reserved.
//

import Bagel

final class NetworkLogger: NSObject {
    static let shared = NetworkLogger()
    
    override private init() { }
}

extension NetworkLogger: UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        #if DEBUG
        if Configurations.Network.logNetworkActivity {
            Bagel.start()
        }
        #endif
        return true
    }
}
