//
//  UIFont+Extensions.swift
//  BaseProject
//
//  Created by Enes Karaosman on 9.10.2020.
//  Copyright © 2020 Enes Karaosman. All rights reserved.
//

import UIKit

extension UIFont {
    
    var bold: UIFont { with(.traitBold) }

    var italic: UIFont { with(.traitItalic) }

    var boldItalic: UIFont { with([.traitBold, .traitItalic]) }

    func with(_ traits: UIFontDescriptor.SymbolicTraits...) -> UIFont {
        guard let descriptor = self.fontDescriptor.withSymbolicTraits(
            UIFontDescriptor.SymbolicTraits(traits).union(self.fontDescriptor.symbolicTraits)
        ) else {
            return self
        }
        return UIFont(descriptor: descriptor, size: 0)
    }

    func without(_ traits: UIFontDescriptor.SymbolicTraits...) -> UIFont {
        guard let descriptor = self.fontDescriptor.withSymbolicTraits(
            self.fontDescriptor.symbolicTraits.subtracting(UIFontDescriptor.SymbolicTraits(traits))
        ) else {
            return self
        }
        return UIFont(descriptor: descriptor, size: 0)
    }
    
}
