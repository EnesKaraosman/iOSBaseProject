//
//  BaseViewModel.swift
//  BaseProject
//
//  Created by Enes Karaosman on 10.01.2020.
//  Copyright © 2020 Enes Karaosman. All rights reserved.
//

import Combine
import EKNetworkModule

class BaseViewModel: BaseViewModelBehaviour {
    
    let cancellable = Set<AnyCancellable>()

    var api: APIClientProtocol?
    
    typealias ErrorTuple = (String?, ErrorPresentationType)
    var error = PassthroughSubject<ErrorTuple, Never>()
//    var noDataFoundScreen: BehaviorRelay<Bool>

    init(api: APIClientProtocol? = nil) {
        self.api = api
    }
    
}
