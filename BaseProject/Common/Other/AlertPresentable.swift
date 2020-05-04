//
//  AlertPresenter.swift
//  BaseProject
//
//  Created by Enes Karaosman on 10.01.2020.
//  Copyright © 2020 Enes Karaosman. All rights reserved.
//

import UIKit
import SCLAlertView

protocol AlertPresentable {
//    var appearance: SCLAlertView.SCLAppearance { get set }
    func showSuccess(message: String, title: String, appearance: SCLAlertView.SCLAppearance)
    func showError(message: String, title: String, appearance: SCLAlertView.SCLAppearance)
}

extension AlertPresentable {
    
    func showSuccess(message: String, title: String = "", appearance: SCLAlertView.SCLAppearance = .init()) {
        let appearance = appearance
        SCLAlertView(appearance: appearance).showSuccess(title, subTitle: message)
    }
    
    func showError(message: String, title: String = "", appearance: SCLAlertView.SCLAppearance = .init()) {
        SCLAlertView(appearance: appearance).showError(title, subTitle: message)
    }
    
}
