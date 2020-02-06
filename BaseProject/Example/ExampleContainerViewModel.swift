//
//  ExampleContainerViewModel.swift
//  BaseProject
//
//  Created by Enes Karaosman on 3.02.2020.
//  Copyright © 2020 Enes Karaosman. All rights reserved.
//

import XCoordinator

class ExampleContainerViewModel: BaseViewModel {
    
    private let router: UnownedErased<StrongRouter<AppRoute>>
    
    init(router: UnownedErased<StrongRouter<AppRoute>>) {
        self.router = router
    }
    
    func routeSelected(route: AppRoute) {
        router.trigger(route)
    }
    
}
