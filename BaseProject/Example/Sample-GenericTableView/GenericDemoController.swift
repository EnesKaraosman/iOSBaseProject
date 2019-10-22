//
//  GenericDemoController.swift
//  BaseProject
//
//  Created by Enes Karaosman on 21.10.2019.
//  Copyright © 2019 Enes Karaosman. All rights reserved.
//

import UIKit
import Kingfisher

class GenericDemoController: GenericTableViewController<ArticleCell, Article> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // You can initialize whenever you want!.
        items = [
            Article(name: "Dr. Lessie Lesch", avatar: "https://s3.amazonaws.com/uifaces/faces/twitter/evanshajed/128.jpg"),
            Article(name: "Raina Douglas", avatar: "https://s3.amazonaws.com/uifaces/faces/twitter/digitalmaverick/128.jpg"),
            Article(name: "Rosetta Parker", avatar: "https://s3.amazonaws.com/uifaces/faces/twitter/overra/128.jpg"),
            Article(name: "Krista Williamson", avatar: "https://s3.amazonaws.com/uifaces/faces/twitter/thekevinjones/128.jpg"),
            Article(name: "Jovanny Crist", avatar: "https://s3.amazonaws.com/uifaces/faces/twitter/craigrcoles/128.jpg")
        ]
        
    }
    
}

// Your custom GenericTableViewCell with it's model.
class ArticleCell: GenericTableViewCell<Article> {
    
    private lazy var articleImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 17, weight: .bold)
        return lbl
    }()
    
    override var item: Article! {
        didSet {
            titleLabel.text = item.name
            guard let imageUrl = URL(string: item.avatar ?? "") else { return }
            articleImageView.kf.setImage(with: imageUrl)
        }
    }
    
    override func commonInit() {
        super.commonInit()
        
        container.addSubview(titleLabel)
        container.addSubview(articleImageView)
        
        articleImageView.snp.makeConstraints {
            $0.left.bottom.top.equalToSuperview()
            $0.width.height.equalTo(80)
        }
        
        titleLabel.snp.makeConstraints {
            $0.left.equalTo(articleImageView.snp.right).offset(16)
            $0.right.bottom.top.equalToSuperview()
        }
        
    }
    
}
