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

    lazy var button: CommonButton = CommonButton {
        $0.setTitle("Tap", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.setTitleColor(UIColor.white.withAlphaComponent(0.8), for: .highlighted)
        $0.setTitleColor(UIColor.white.withAlphaComponent(0.5), for: .disabled)
        $0.normalBackgroundColor = .systemOrange
        $0.highlightedBackgroundColor = UIColor.systemOrange.withAlphaComponent(0.5)
        $0.disabledBackgroundColor = .lightGray
        $0.tapHandler = {
            print("I am tapped!!")
        }
    }
    
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
