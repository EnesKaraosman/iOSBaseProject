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
    
    var api: APIClientProtocol?
    var error = BehaviorRelay<(String?, ErrorPresentationType)>(value: (nil, .alert))
    let disposeBag = DisposeBag()
    
    init(api: APIClientProtocol? = nil) {
        self.api = api
    }
    
}
