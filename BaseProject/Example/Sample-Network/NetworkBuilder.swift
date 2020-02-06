//
//  NetworkBuilder.swift
//  BaseProject
//
//  Created by Enes Karaosman on 3.02.2020.
//  Copyright © 2020 Enes Karaosman. All rights reserved.
//

import Foundation

class NetworkBuilder {
    class func build() -> NetworkViewController {
        let viewModel = NetworkViewModel(api: APIClient.instance)
        let view = NetworkViewController(viewModel: viewModel)
        return view
    }
}
