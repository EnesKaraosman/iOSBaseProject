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
    
    // Uses static color, be carefull. (you may miss themeing)
    init(font: UIFont = .body, text: String? = nil, color: UIColor = #colorLiteral(red: 0.06934740394, green: 0.06894309819, blue: 0.06966326386, alpha: 1), alignment: NSTextAlignment = .left) {
        super.init(frame: .zero)
        self.font = font
        self.text = text
        self.textColor = color
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
    
    func makeMultiline() -> CommonLabel {
        self.numberOfLines = 0
        self.lineBreakMode = .byWordWrapping
        return self
    }
    
}

// MARK: - Chainable initializers
extension CommonLabel {
    
    func setText(text: String) -> CommonLabel {
        self.text = text
        return self
    }
    
    func setFont(font: UIFont) -> CommonLabel {
        self.font = font
        return self
    }
    
    func setTextColor(color: UIColor) -> CommonLabel {
        self.textColor = color
        return self
    }
    
    func setTextAlignment(alignment: NSTextAlignment) -> CommonLabel {
        self.textAlignment = alignment
        return self
    }
    
}
