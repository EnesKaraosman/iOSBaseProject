//
//  NetworkEnvironment.swift
//  BaseProject
//
//  Created by Enes Karaosman on 3.11.2020.
//  Copyright © 2020 Enes Karaosman. All rights reserved.
//

import UIKit
import EKNetworkModule

extension EKAPIClient: UIApplicationDelegate {
    public func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        let baseUrl = Configurations.Environment.selected.url
        Log.i(baseUrl)
        EKAPIClient.shared.networkEnvironment = EKNetworkEnvironment(baseUrl: baseUrl)
        return true
    }
}
