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
        self.error.accept(("Balon Batladi!", .alert))
        self.api?.executeGET(
            endPoint: "articles",
            success: onSuccess,
            failure: { (error) in
                self.error.accept((error.localizedDescription, .alert))
            }
        )
    }
    
}
