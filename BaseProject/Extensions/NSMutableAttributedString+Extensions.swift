//
//  NSMutableAttributedString+Extensions.swift
//  BaseProject
//
//  Created by Enes Karaosman on 13.01.2020.
//  Copyright © 2020 Enes Karaosman. All rights reserved.
//

import UIKit

extension NSMutableAttributedString {

  /**
   
   Appends a new text with a given font and a given color to an existing NSMutableAttributedString
   It's useful when, for example, a text is required to have some parts in bold, or in a different color
   
   How to use it:
   
   label.attributedText = NSMutableAttributedString()
    .appendText(text: R.string.localization.text(), withFont: UIFont.regular, withColor: UIColor.grey)
    .appendText(text: R.string.localization.appName(), withFont: UIFont.bold, withColor: UIColor.white)
   
   */
  @discardableResult func appendText(text: String, withFont font: UIFont, withColor color: UIColor) -> NSMutableAttributedString {
      let attrs: [NSAttributedString.Key: Any] = [.font: font, .foregroundColor: color]
      let attributedString = NSMutableAttributedString(string: text, attributes: attrs)
      self.append(attributedString)
      return self
  }
    
}
