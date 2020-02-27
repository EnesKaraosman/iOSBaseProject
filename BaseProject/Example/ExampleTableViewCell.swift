//
//  ExampleTableViewCell.swift
//  BaseProject
//
//  Created by Enes Karaosman on 22.09.2019.
//  Copyright © 2019 Enes Karaosman. All rights reserved.
//

import UIKit
import SnapKit
import LBTATools

class ExampleTableViewCell: LBTAListCell<SamplePage> {

    override var item: SamplePage! {
        didSet {
            self.imageName = item.systemIconName
            self.titleLabel.text = item.name
        }
    }
    
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
    
    override func setupViews() {
        super.setupViews()
        commonInit()
    }
    
    func commonInit() {
        self.addSubviews(iconImageView, titleLabel)
        
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
