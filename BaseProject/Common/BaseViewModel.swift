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
    
    let disposeBag = DisposeBag()

    var api: IAPIClient?
    
    var error = BehaviorRelay<(String?, ErrorPresentationType)>(value: (nil, .alert))
//    var noDataFoundScreen: BehaviorRelay<Bool>

    init(api: IAPIClient? = nil) {
        self.api = api
    }
    
}
