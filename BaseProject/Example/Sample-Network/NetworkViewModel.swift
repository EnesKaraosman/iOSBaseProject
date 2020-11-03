//
//  NetworkViewModel.swift
//  BaseProject
//
//  Created by Enes Karaosman on 3.02.2020.
//  Copyright © 2020 Enes Karaosman. All rights reserved.
//

import Foundation

class NetworkViewModel: BaseViewModel {
    
    func networkTest(onSuccess: @escaping (([Article]) -> Void)) {
        self.api?.executeGET(
            endPoint: EndPoints.articles,
            success: onSuccess,
            failure: { (error) in
                self.error.send((error.localizedDescription, .alert))
            }
        )
    }
    
}
