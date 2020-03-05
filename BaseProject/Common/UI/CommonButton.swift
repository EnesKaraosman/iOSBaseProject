//
//  BaseButton.swift
//  BaseProject
//
//  Created by Enes Karaosman on 18.11.2019.
//  Copyright © 2019 Enes Karaosman. All rights reserved.
//

import UIKit

class CommonButton: UIButton {
    
    var tapHandler: ((UIButton) -> Void)? {
        didSet {
            self.removeTarget(self, action: #selector(selfTapped(sender:)), for: .touchUpInside)
            guard tapHandler != nil else { return }
            self.addTarget(self, action: #selector(selfTapped(sender:)), for: .touchUpInside)
        }
    }
    
    init(text: String, textColor: UIColor) {
        super.init(frame: .zero)
        self.setTitle(text, for: .normal)
        self.setTitleColor(textColor, for: .normal)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
    func initialize() {
        titleLabel?.font = .init(.body, .semiBold)
    }
    
    @objc private func selfTapped(sender: UIButton) {
        tapHandler?(sender)
    }
    
}
