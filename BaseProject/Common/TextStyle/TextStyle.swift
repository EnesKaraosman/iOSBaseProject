//
//  TextStyle.swift
//  BaseProject
//
//  Created by Enes Karaosman on 4.03.2020.
//  Copyright © 2020 Enes Karaosman. All rights reserved.
//

import UIKit

enum FontFamily: String {
    case system = ".SFUIText" //".SFUI"
    case menlo = "Menlo"
    //easy to change default app fonts family
    static let defaultFamily = Configurations.Fonts.primary
}

enum FontWeight: String {
    case regular = "", medium, light, heavy, bold, semibold, black
}

enum FontSize {
    /// Large Title - 34
    case titleLarge
    /// Title1 - 28
    case title1
    /// Title2 - 22
    case title2
    /// Title3 - 20
    case title3
    /// Body - 17
    case body
    /// Subhead - 15
    case subhead
    /// Footnote - 13
    case footnote
    /// Caption - 12
    case caption1
    /// Caption - 11
    case caption2
    /// Custom
    case custom(CGFloat)
    
    var value: CGFloat {
        switch self {
        case .titleLarge:
            return 34
        case .title1:
            return 28
        case .title2:
            return 22
        case .title3:
            return 20
        case .body:
            return 17
        case .subhead:
            return 15
        case .footnote:
            return 13
        case .caption1:
            return 12
        case .caption2:
            return 11
        case .custom(let size):
            return size
        }
    }
}

// method provides you the option to list incompatible Font Family and Weight.
// (For example Inter has no Heavy Weight)
fileprivate func stringName(_ family: FontFamily, _ weight: FontWeight) -> String {
    let fontWeight: String
    switch (family, weight) {
    case (.menlo, .semibold):
        fontWeight = FontWeight.bold.rawValue
    default:
        fontWeight = weight.rawValue
    }
    let familyName = family.rawValue
    return fontWeight.isEmpty ? "\(familyName)" : "\(familyName)-\(fontWeight)"
}

// For SwiftUI extend Font
extension UIFont {
    
    public static let title: UIFont = .init(.title1, .bold)
    public static let body: UIFont  = .init(.body, .regular)

    convenience init(_ size: FontSize, _ weight: FontWeight) {
        self.init(.defaultFamily, size, weight)
    }
    
    convenience init(_ family: FontFamily = .defaultFamily,
                     _ size: FontSize, _ weight: FontWeight) {
        self.init(name: stringName(family, weight), size: size.value)!
    }
    
}

/**
 Usage;
 
 let label = UILabel()
 label.font = .init(.body, .bold)

 */

/**
 https://developer.apple.com/design/human-interface-guidelines/ios/visual-design/typography/
 Human Interface guidelines
 
 Style              Weight    Size (Points)    Leading (Points)
 Large Title        Regular         34              41
 Title 1            Regular         28              34
 Title 2            Regular         22    			28
 Title 3            Regular         20    			25
 Headline           Semi-Bold       17    			22
 Body               Regular         17    			22
 Callout            Regular         16    			21
 Subhead            Regular         15    			20
 Footnote           Regular         13    			18
 Caption 1          Regular         12    			16
 Caption 2          Regular         11    			13
 */
