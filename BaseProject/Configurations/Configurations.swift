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
        static let primary: UIFont = .monospacedSystemFont(ofSize: 17, weight: .regular)
        static let title: UIFont = .monospacedSystemFont(ofSize: 21, weight: .bold)
        static let text: UIFont = .monospacedSystemFont(ofSize: 17, weight: .regular)
    }
    struct Network {
        static let logNetworkActivity = true
    }
    enum Environment: String {
        case prod = "https://5da476a3a6593f001407a7af.mockapi.io/"
        case dev = ""
    }
}
