//
//  BaseViewModelBehaviour.swift
//  BaseProject
//
//  Created by Enes Karaosman on 10.01.2020.
//  Copyright © 2020 Enes Karaosman. All rights reserved.
//

import Foundation
import UIKit
import NVActivityIndicatorView

protocol BaseViewModelBehaviour: LoaderPresentable, AlertPresentable {
    
}

extension BaseViewModelBehaviour {
    
}

protocol ViewModelContract where Self: BaseViewModel {
    /// Input that is ViewModel process.
    associatedtype Input
    /// Output that is Controller about to subscribe.
    associatedtype Output
}
