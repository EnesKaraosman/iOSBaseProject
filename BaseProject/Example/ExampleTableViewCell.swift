//
//  ExampleTableViewCell.swift
//  BaseProject
//
//  Created by Enes Karaosman on 22.09.2019.
//  Copyright © 2019 Enes Karaosman. All rights reserved.
//

import UIKit
import SnapKit

class ExampleTableViewCell: UITableViewCell {

    private lazy var iconImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 17, weight: .bold)
        return lbl
    }()
    
    public var imageName: String? {
        didSet {
            iconImageView.image = UIImage(named: imageName!)
        }
    }
    
    public func setCell(sampleView: SamplePage) {
        self.imageName = sampleView.systemIconName
        self.titleLabel.text = sampleView.name
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        self.addSubview(iconImageView)
        self.addSubview(titleLabel)
        
        iconImageView.snp.makeConstraints {
            $0.left.top.bottom.equalToSuperview().inset(16)
            $0.width.equalTo(24)
        }
        
        titleLabel.snp.makeConstraints {
            $0.left.equalTo(iconImageView.snp.right).offset(16)
            $0.right.top.bottom.equalToSuperview().inset(16)
        }
        
    }
    
}
