//
//  UIEdgeInsets+Extensions.swift
//  BaseProject
//
//  Created by Enes Karaosman on 3.03.2020.
//  Copyright © 2020 Enes Karaosman. All rights reserved.
//

import UIKit

extension UIEdgeInsets {
    
    enum Edges {
        case top, left, bottom, right
    }
    
    static let tiny_all_edges = UIEdgeInsets(top: Spacing.tiny, left: Spacing.tiny, bottom: Spacing.tiny, right: Spacing.tiny)
    static let small_all_edges = UIEdgeInsets(top: Spacing.small, left: Spacing.small, bottom: Spacing.small, right: Spacing.small)
    static let large_all_edges = UIEdgeInsets(top: Spacing.large, left: Spacing.large, bottom: Spacing.large, right: Spacing.large)
    
    static func make(spacing: CGFloat, edges: Edges...) -> UIEdgeInsets {
        let topSpacing = edges.contains(.top) ? spacing : 0
        let leftSpacing = edges.contains(.left) ? spacing : 0
        let bottomSpacing = edges.contains(.bottom) ? spacing : 0
        let rightSpacing = edges.contains(.right) ? spacing : 0
        return UIEdgeInsets(top: topSpacing, left: leftSpacing, bottom: bottomSpacing, right: rightSpacing)
    }
    
}
