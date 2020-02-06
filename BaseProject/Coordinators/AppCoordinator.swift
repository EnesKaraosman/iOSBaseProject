//
//  AppCoordinator.swift
//  BaseProject
//
//  Created by Enes Karaosman on 3.02.2020.
//  Copyright © 2020 Enes Karaosman. All rights reserved.
//

import XCoordinator

enum AppRoute: Route {
    case home
    case networkSample
    case genericListSample
    case templateSample
}

class AppCoordinator: NavigationCoordinator<AppRoute> {
    
    init() {
        super.init(initialRoute: .home)
    }
    
    override func prepareTransition(for route: AppRoute) -> NavigationTransition {
        switch route {
        case .home:
            return .push(
                ExampleContainerBuilder()
                    .build(router: unownedRouter)
            )
        case .networkSample:
            return .present(NetworkBuilder.build())
        case .genericListSample:
            return .present(GenericListBuilder.build())
        case .templateSample:
            return .present(TemplateBuilder.build())
        }
    }
    
}
