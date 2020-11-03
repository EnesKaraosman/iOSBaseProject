//
//  GenericListBuilder.swift
//  BaseProject
//
//  Created by Enes Karaosman on 3.02.2020.
//  Copyright © 2020 Enes Karaosman. All rights reserved.
//

import Foundation
import EKNetworkModule

class GenericListBuilder {
    class func build() -> GenericListController {
        let viewModel = GenericListViewModel(api: EKAPIClient.shared)
        let view = GenericListController(viewModel: viewModel)
        return view
    }
}
