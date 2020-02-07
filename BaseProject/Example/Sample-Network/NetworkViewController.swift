//
//  NetworkExampleViewController.swift
//  BaseProject
//
//  Created by Enes Karaosman on 22.09.2019.
//  Copyright © 2019 Enes Karaosman. All rights reserved.
//

import UIKit
import SnapKit
import Toast_Swift
import Highlightr

class NetworkViewController: BaseViewController<NetworkViewModel> {
    
    private lazy var codeLabel: UILabel = {
        
        let v = Highlightr()
        v!.setTheme(to: "paraiso-dark")
        
        let lbl = UILabel()
        lbl.attributedText = v?.highlight("""
        self.viewModel?.api?.executeGET(
            endPoint: "articles",
            success: { (articles: [Article]) in
                print(articles.count)
            }, failure: { (error) in
                print(error.localizedDescription)
            }
        )
        """, as: "Swift", fastRender: true)
        
        lbl.numberOfLines = 0
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel?.networkTest(onSuccess: { (articles) in
//            self.view.makeToast("\(articles.count)")
        })
    }
    
    override func setupUI() {
        super.setupUI()
        
        self.view.backgroundColor = #colorLiteral(red: 0.1422876716, green: 0.1694026589, blue: 0.1220108792, alpha: 1)
        self.view.addSubview(codeLabel)
        self.codeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
            $0.left.right.equalToSuperview().inset(16)
        }
        
    }
    
}
