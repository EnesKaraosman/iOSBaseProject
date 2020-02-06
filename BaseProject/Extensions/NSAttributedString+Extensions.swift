//
//  NSAttrıbutedString+Extensions.swift
//  BaseProject
//
//  Created by Enes Karaosman on 6.02.2020.
//  Copyright © 2020 Enes Karaosman. All rights reserved.
//

import UIKit

extension NSAttributedString {
    
    /**
     Usage:
     label.attributedText = NSAttributedString(string: "Budapest")
     label.attributedText = label.attributedText?.highlighting("Bud", using: .blue)
     */
    func highlighting(_ substring: String, using color: UIColor) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(attributedString: self)
        attributedString.addAttribute(
            .foregroundColor,
            value: color,
            range: (self.string as NSString).range(of: substring)
        )
        return attributedString
    }
    
}
