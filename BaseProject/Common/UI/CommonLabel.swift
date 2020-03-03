//
//  CommonLabel.swift
//  BaseProject
//
//  Created by Enes Karaosman on 3.03.2020.
//  Copyright © 2020 Enes Karaosman. All rights reserved.
//

import UIKit

class CommonLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    init(text: String) {
        super.init(frame: .zero)
        self.text = text
    }
    
    func commonInit() {
        self.font = .monospacedSystemFont(ofSize: 17, weight: .medium)
        self.backgroundColor = .clear
        self.theme_textColor = GlobalPicker.textColor
    }
    
}
