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
    
}

// MARK: - Chainable initializers
extension CommonLabel {
    
    /// Sets the text.
    func setText(text: String) -> Self {
        self.text = text
        return self
    }
    
    /// Sets the default font for text in the view.
    func font(_ font: UIFont) -> Self {
        self.font = font
        return self
    }
    
    /// Sets the color of the text displayed by this view.
    func foregroundColor(color: UIColor) -> Self {
        self.textColor = color
        return self
    }
    
    /// Applies a bold font weight to the text.
    func bold() -> Self {
        self.font = .init(.custom(self.font.pointSize), .bold)
        return self
    }
    
    /// Applies italics to the text.
    func italic() -> Self {
        self.font = self.font.italic
        return self
    }
    
    /// Sets the font weight of the text.
    func fontWeight(_ weight: FontWeight) -> Self {
        self.font = .init(.custom(self.font.pointSize), weight)
        return self
    }
    
    /// Sets the backgroundColor of the text displayed by this view.
    func backgroundColor(color: UIColor) -> Self {
        self.backgroundColor = color
        return self
    }
    
    /// Sets the alignment of multiline text in this view.
    func setTextAlignment(alignment: NSTextAlignment) -> Self {
        self.textAlignment = alignment
        return self
    }
    
    /// Makes label multiline with the given lineBreakMode.
    func multiLined(lineBreakMode: NSLineBreakMode = .byWordWrapping) -> Self {
        self.numberOfLines = 0
        self.lineBreakMode = lineBreakMode
        return self
    }
    
}
