//
//  GenericTableViewCell.swift
//  BaseProject
//
//  Created by Enes Karaosman on 21.10.2019.
//  Copyright © 2019 Enes Karaosman. All rights reserved.
//

import UIKit

class GenericTableViewCell<U>: UITableViewCell {
    
    var item: U!
    
    lazy var container: UIView = {
        let v = UIView()
        return v
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        self.addSubview(container)
        container.snp.makeConstraints { $0.edges.equalToSuperview().inset(16) }
    }
    
}
