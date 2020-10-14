//
//  CommonStackView.swift
//  BaseProject
//
//  Created by Enes Karaosman on 14.10.2020.
//  Copyright © 2020 Enes Karaosman. All rights reserved.
//

import UIKit

class CommonStackView: CommonView {
    
    public var stackView = UIStackView()
    
    public init(configure: @escaping (UIStackView) -> Void) {
        super.init(frame: .zero)
        commonInit()
        configure(self.stackView)
    }
    
    public init() {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override func commonInit() {
        super.commonInit()
        self.addSubview(stackView)
        stackView.fillSuperview()
    }
    
}

class Vstack: CommonStackView {
    
    override func commonInit() {
        super.commonInit()
        self.stackView.axis = .vertical
    }
    
}

class Hstack: CommonStackView {

    override func commonInit() {
        super.commonInit()
        self.stackView.axis = .horizontal
    }
    
}
