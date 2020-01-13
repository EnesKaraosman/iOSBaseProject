//
//  TemplateBuilder.swift
//  BaseProject
//
//  Created by Enes Karaosman on 13.01.2020.
//  Copyright © 2020 Enes Karaosman. All rights reserved.
//

import Foundation

class TemplateBuilder {
    class func build() -> TemplateViewController {
        let viewModel = TemplateViewModel(api: APIClient.instance)
        let view = TemplateViewController(viewModel: viewModel)
        return view
    }
}
