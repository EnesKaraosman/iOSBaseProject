//
//  UILabViewController.swift
//  BaseProject
//
//  Created by Enes Karaosman on 9.10.2020.
//  Copyright © 2020 Enes Karaosman. All rights reserved.
//

import UIKit
import SnapKit

class UILabViewController: UIViewController {

    lazy var button: CommonButton = {
        let btn = CommonButton(title: "Tap") {
            print("I am tapped!!")
        }
        btn.setTitleColor(.white, for: .normal)
        btn.setTitleColor(UIColor.white.withAlphaComponent(0.8), for: .highlighted)
        btn.setTitleColor(UIColor.white.withAlphaComponent(0.5), for: .disabled)
        btn.normalBackgroundColor = .systemOrange
        btn.highlightedBackgroundColor = UIColor.systemOrange.withAlphaComponent(0.5)
        btn.disabledBackgroundColor = .lightGray
        
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(button)
        button.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.left.right.equalToSuperview().inset(Spacing.small)
        }
        
    }
    
}
