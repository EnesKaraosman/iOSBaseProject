//
//  TextStyle.swift
//  BaseProject
//
//  Created by Enes Karaosman on 4.03.2020.
//  Copyright © 2020 Enes Karaosman. All rights reserved.
//

import UIKit

enum FontFamily: String, Codable, CaseIterable, Comparable {

    case raleway = "Raleway"
    case spartan = "Spartan"

    static var onlySystemFonts: [String] {
        return UIFont.familyNames
    }
    
    // Changable Font from settings.
    static var defaultFamily: FontFamily {
        return Configurations.Fonts.primary
    }
    
    static func < (lhs: FontFamily, rhs: FontFamily) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
    
}

enum FontWeight: String {
    case regular  = "Regular"
    case medium   = "Medium"
    case light    = "Light"
    case bold     = "Bold"
    case semiBold = "SemiBold"
    case italic   = "Italic"
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

// Provides you the option to fallback incompatible Font Family and Weight.
private func stringName(_ family: FontFamily, _ weight: FontWeight) -> String {
    let fontWeight: String
    switch (family, weight) {
    case (.spartan, .italic): // Spartan-Italic does not exist.
        fontWeight = FontWeight.regular.rawValue
    default:
        fontWeight = weight.rawValue
    }
    let familyName = family.rawValue
    return fontWeight.isEmpty ? "\(familyName)" : "\(familyName)-\(fontWeight)"
    // Like Raleway-Regular
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
        if Bundle.main.url(forResource: stringName(family, weight), withExtension: "ttf") != nil {
            if !checkFontExist(name: stringName(family, weight)) {
                Log.e("\(family.rawValue) Font is not added to .plist!!")
                self.init(name: FontFamily.raleway.rawValue, size: size.value)!
                return
            }
            self.init(name: stringName(family, weight), size: size.value)!
            return
        }
        Log.e("\(family.rawValue) Font is not added to bundle!!")
        self.init(name: FontFamily.raleway.rawValue, size: size.value)!
    }
    
}

private func checkFontExist(name: String) -> Bool {
    let fonts = Bundle.main.object(forInfoDictionaryKey: "UIAppFonts") as! [String]
    return fonts.first { $0.contains(name) } != nil
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
