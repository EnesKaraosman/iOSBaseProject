//
//  CommonLabel.swift
//  BaseProject
//
//  Created by Enes Karaosman on 3.03.2020.
//  Copyright © 2020 Enes Karaosman. All rights reserved.
//

import UIKit

class CommonLabel: UILabel {
    
    static var title = CommonLabel(font: .title)
    static var body = CommonLabel(font: .body)
    
    init(font: UIFont = .body, text: String? = nil, alignment: NSTextAlignment = .left) {
        super.init(frame: .zero)
        self.font = font
        self.text = text
        self.textAlignment = alignment
    }
    
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
        self.font = .body
        self.backgroundColor = .clear
        self.theme_textColor = GlobalPicker.textColor
    }
    
    func makeMultiline() {
        self.numberOfLines = 0
        self.lineBreakMode = .byWordWrapping
    }
    
}
