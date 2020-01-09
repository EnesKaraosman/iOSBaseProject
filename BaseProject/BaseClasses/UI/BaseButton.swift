//
//  BaseButton.swift
//  BaseProject
//
//  Created by Enes Karaosman on 18.11.2019.
//  Copyright © 2019 Enes Karaosman. All rights reserved.
//

import UIKit

class BaseButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
    func initialize() {
        addTarget(self, action: #selector(baseAction), for: .touchUpInside)
    }
    
    @objc func baseAction() {
        Log.i("BaseButton Action")
    }
    
}
