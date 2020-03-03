//
//  CommonView.swift
//  BaseProject
//
//  Created by Enes Karaosman on 3.03.2020.
//  Copyright © 2020 Enes Karaosman. All rights reserved.
//

import UIKit

class CommonView: UIView {
    
    var tapHandler: (() -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
        
    @objc private func selfTapped() {
        self.tapHandler?()
    }
    
    func commonInit() {
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(selfTapped))
        self.addGestureRecognizer(tapGR)
    }
    
}
