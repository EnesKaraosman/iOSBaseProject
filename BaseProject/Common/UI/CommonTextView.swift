//
//  CommonTextView.swift
//  BaseProject
//
//  Created by Enes Karaosman on 14.11.2019.
//  Copyright © 2019 Enes Karaosman. All rights reserved.
//

import UIKit

class CommonTextView: UITextView {
    
    convenience init() {
        self.init()
        initTextView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initTextView()
    }
    
    private func initTextView() {
        if #available(iOS 13.0, *) {
            usesStandardTextScaling = true
        }
    }
    
}
