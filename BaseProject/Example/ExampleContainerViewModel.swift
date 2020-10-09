//
//  ExampleContainerViewModel.swift
//  BaseProject
//
//  Created by Enes Karaosman on 3.02.2020.
//  Copyright © 2020 Enes Karaosman. All rights reserved.
//

import XCoordinator

struct SamplePage {
    let name: String
    let systemIconName: String
    let route: AppRoute
}

class ExampleContainerViewModel: BaseViewModel {
    
    private let router: UnownedErased<StrongRouter<AppRoute>>
    
    init(router: UnownedErased<StrongRouter<AppRoute>>) {
        self.router = router
    }
    
    func routeSelected(route: AppRoute) {
        router.trigger(route)
    }
    
    func getSamplePages() -> [SamplePage] {
        return [
            SamplePage(
                name: "Network".localized(),
                systemIconName: "network",
                route: .networkSample
            ),
            SamplePage(
                name: "Generic ListController".localized(),
                systemIconName: "arrows",
                route: .genericListSample
            ),
            SamplePage(
                name: "Template Controller".localized(),
                systemIconName: "template",
                route: .templateSample
            ),
            SamplePage(
                name: "Settings".localized(),
                systemIconName: "settings",
                route: .settingsSample
            ),
            SamplePage(
                name: "UILab".localized(),
                systemIconName: "settings",
                route: .uiLab
            )
        ]
    }
    
}
