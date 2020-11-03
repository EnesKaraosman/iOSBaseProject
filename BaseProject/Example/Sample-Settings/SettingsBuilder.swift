//
//  SettingsBuilder.swift
//  BaseProject
//
//  Created by Enes Karaosman on 2.03.2020.
//  Copyright © 2020 Enes Karaosman. All rights reserved.
//

import Foundation
import EKNetworkModule

class SettingsBuilder {
    class func build() -> SettingsViewController {
        let viewModel = SettingsViewModel(api: EKAPIClient.shared)
        let view = SettingsViewController(viewModel: viewModel)
        return view
    }
}
