//
//  String+Extensions.swift
//  BaseProject
//
//  Created by Enes Karaosman on 15.10.2019.
//  Copyright © 2019 Enes Karaosman. All rights reserved.
//

import Foundation

extension String {
    func localized(with comment: String = "") -> String {
        return NSLocalizedString(self, comment: comment)
//        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: comment)
    }
}
