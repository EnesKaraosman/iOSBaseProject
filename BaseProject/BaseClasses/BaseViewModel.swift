//
//  BaseViewModel.swift
//  BaseProject
//
//  Created by Enes Karaosman on 10.01.2020.
//  Copyright © 2020 Enes Karaosman. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class BaseViewModel: BaseViewModelBehaviour {
    
    var api: APIClient?
    var error = BehaviorRelay<String?>(value: nil)
    
    init(api: APIClient? = nil) {
        self.api = api
    }
    
}
