//
//  GenericDemoController.swift
//  BaseProject
//
//  Created by Enes Karaosman on 21.10.2019.
//  Copyright © 2019 Enes Karaosman. All rights reserved.
//

import UIKit
import LBTATools
import SDWebImage

class GenericListController: LBTAListController<ArticleCell, Article>, UICollectionViewDelegateFlowLayout {

    var viewModel: GenericListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.backgroundColor = .primaryBackground

        viewModel?.getList(articles: { (articles) in
            self.items = articles
//            Timer.setTimeout(delay: 5) {
//                self.viewModel?.showSuccess(message: "Yeey!")
//            }
        })
        
    }
    
    init(viewModel: BaseViewModel) {
        self.viewModel = viewModel as? GenericListViewModel
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: self.view.frame.width, height: 80)
    }
    
}

// Your custom GenericTableViewCell with it's model.
class ArticleCell: LBTAListCell<Article> {
    
    private lazy var articleImageView = CircularImageView(width: 50)
    
    private lazy var titleLabel = CommonLabel().font(.init(.body, .semiBold))
    
    override var item: Article! {
        didSet {
            titleLabel.text = item.name
            guard let imageUrl = URL(string: item.avatar ?? "") else { return }
            articleImageView.sd_setImage(with: imageUrl, completed: nil)
        }
    }
    
    override func setupViews() {
        super.setupViews()
        
        self.backgroundColor = .clear
        self.addSubviews(titleLabel, articleImageView)

        articleImageView.snp.makeConstraints {
            $0.left.centerY.equalToSuperview().inset(8)
        }

        titleLabel.snp.makeConstraints {
            $0.left.equalTo(articleImageView.snp.right).offset(16)
            $0.right.bottom.top.equalToSuperview()
        }
        
        addSeparatorView(leadingAnchor: titleLabel.leadingAnchor)
        
    }
    
}
