//
//  BaseButton.swift
//  BaseProject
//
//  Created by Enes Karaosman on 18.11.2019.
//  Copyright © 2019 Enes Karaosman. All rights reserved.
//

import UIKit

class CommonButton: UIButton {
    
    var tapHandler: ((UIButton) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
    func initialize() {
        addTarget(self, action: #selector(baseAction(sender:)), for: .touchUpInside)
    }
    
    @objc func baseAction(sender: UIButton) {
        tapHandler?(sender)
        Log.i("BaseButton Action")
    }
    
}
