//
//  UIViewController+Extensions.swift
//  BaseProject
//
//  Created by Enes Karaosman on 6.02.2020.
//  Copyright © 2020 Enes Karaosman. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func embed(_ vc: UIViewController, padding: CGFloat = 0, in containerView: UIView? = nil) {
        let _containerView: UIView = containerView ?? view
        _containerView.addSubview(vc.view)
        NSLayoutConstraint.activate([
            vc.view.leadingAnchor
                .constraint(equalTo: _containerView.leadingAnchor, constant: padding),
            vc.view.trailingAnchor
                .constraint(equalTo: _containerView.trailingAnchor, constant: padding),
            vc.view.topAnchor
                .constraint(equalTo: _containerView.topAnchor, constant: padding),
            vc.view.bottomAnchor
                .constraint(equalTo: _containerView.bottomAnchor, constant: padding)
        ])
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        addChild(vc)
        vc.didMove(toParent: self)
    }
    
}
