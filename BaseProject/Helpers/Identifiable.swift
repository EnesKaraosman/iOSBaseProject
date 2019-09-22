//
//  Identifier.swift
//  SwiftBaseProject
//
//  Created by Federico Ojeda on 4/17/19.
//  Copyright © 2019 Mauricio Cousillas. All rights reserved.
//

import UIKit

/**
 Protocol that allows an element to be indentified. By default, it uses it's class name as the indentifier. This is particularly useful for UITableViewCell and UICollectionViewCell instances, where a reuseIdentifier is needed.

 Usage:
 
 * `class MyCell: UICollectionViewCell, Identifiable { }`

 Whenever the reuseIdentifier is needed:

  * .. `MyCell.identifier` ..
 */
protocol Identifiable {
  static var identifier: String { get }
}

extension Identifiable {
  static var identifier: String {
    return String(describing: type(of: Self.self))
  }
}

extension Identifiable where Self: UITableViewCell {
  var reuseIdentifier: String? {
    return Self.identifier
  }
}

extension Identifiable where Self: UICollectionViewCell {
  var reuseIdentifier: String? {
    return Self.identifier
  }
}

