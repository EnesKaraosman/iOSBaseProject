//
//  UIImage+Extensions.swift
//  BaseProject
//
//  Created by Enes Karaosman on 27.02.2020.
//  Copyright © 2020 Enes Karaosman. All rights reserved.
//

import UIKit

extension UIImage {
    
    /// Create a UIImage of a solid color
    ///
    /// - Parameters:
    ///   - color: The color of the resulting image
    ///   - size: The new image dimensions
    /// - Returns: a new UIImage
    public static func create(withColor color: UIColor, size: CGSize = CGSize(width: 1.0, height: 1.0)) -> UIImage? {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        
        UIGraphicsBeginImageContext(rect.size)
        defer { UIGraphicsEndImageContext() }
        
        let context = UIGraphicsGetCurrentContext()
        
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
}
