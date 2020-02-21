//
//  ViewModelContract.swift
//  BaseProject
//
//  Created by Enes Karaosman on 21.02.2020.
//  Copyright © 2020 Enes Karaosman. All rights reserved.
//

import Foundation

protocol ViewModelContract where Self: BaseViewModel {
    /// Input that is ViewModel process.
    associatedtype Input
    /// Output that is Controller about to subscribe.
    associatedtype Output
    /// Transforms given Input into Output, to subscribe in ViewController
    func transform(input: Input) -> Output
}
