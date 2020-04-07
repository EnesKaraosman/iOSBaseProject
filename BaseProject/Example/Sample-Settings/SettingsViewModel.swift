//
//  SettingsViewModel.swift
//  BaseProject
//
//  Created by Enes Karaosman on 2.03.2020.
//  Copyright © 2020 Enes Karaosman. All rights reserved.
//

import Foundation
import EKNetworkModule

class SettingsViewModel: BaseViewModel, ViewModelContract {
    
    struct Input { }
    struct Output { }
    
    let input: Input
    let output: Output
    
    override init(api: APIClientProtocol? = nil) {
       input = Input()
       output = Output()
       super.init(api: api)
    }
    
    func transform(input: Input) -> Output {
        return Output()
    }

}
