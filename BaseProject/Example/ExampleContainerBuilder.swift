//
//  ExampleContainerBuilder.swift
//  BaseProject
//
//  Created by Enes Karaosman on 3.02.2020.
//  Copyright © 2020 Enes Karaosman. All rights reserved.
//

import XCoordinator

class ExampleContainerBuilder {
    func build(router: UnownedErased<StrongRouter<AppRoute>>) -> ExampleViewController {
        let viewModel = ExampleContainerViewModel(router: router)
        let vc = ExampleViewController(viewModel: viewModel)
        return vc
    }
}
