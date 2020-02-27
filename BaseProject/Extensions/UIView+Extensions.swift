//
//  UIView+Extensions.swift
//  BaseProject
//
//  Created by Enes Karaosman on 6.02.2020.
//  Copyright © 2020 Enes Karaosman. All rights reserved.
//

import UIKit

extension UIView {
    
    /**
     Usage: Ex. Get the cell containing the textfield.
     if let cell = textField.superview(of: TextFieldTableViewCell.self) {
         cell.toggle(isHighlighted: true)
     }
     */
    func superview<T>(of type: T.Type) -> T? {
        return superview as? T ?? superview.flatMap { $0.superview(of: type) }
    }
    
    public func addSubviews(_ views: UIView...) {
        views.forEach(addSubview)
    }
    
}
