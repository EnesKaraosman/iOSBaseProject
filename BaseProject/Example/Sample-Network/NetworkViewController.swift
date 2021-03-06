//
//  NetworkExampleViewController.swift
//  BaseProject
//
//  Created by Enes Karaosman on 22.09.2019.
//  Copyright © 2019 Enes Karaosman. All rights reserved.
//

import UIKit
import Toast
import SafariServices

class NetworkViewController: BaseViewController<NetworkViewModel> {

    private lazy var codeLabel: CommonLabel = {
        return CommonLabel()
            .setText(text: """
                self.viewModel?.api?.executeGET(
                    endPoint: "articles",
                    success: { (articles: [Article]) in
                        print(articles.count)
                    },
                    failure: { (error) in
                        print(error.localizedDescription)
                    }
                )
            """)
            .multiLined()
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.viewModel.networkTest(onSuccess: { (articles) in
            self.view.makeToast("\(articles.count)")
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let web = SFSafariViewController(url: URL(string: "https://github.com/EnesKaraosman/EKNetworkModule/blob/master/README.md")!)
            web.modalPresentationStyle = .fullScreen
            self.present(web, animated: true, completion: nil)
        }
        
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
