//
//  NetworkExampleViewController.swift
//  BaseProject
//
//  Created by Enes Karaosman on 22.09.2019.
//  Copyright © 2019 Enes Karaosman. All rights reserved.
//

import UIKit
import ObjectMapper
import SnapKit
import Toast_Swift
import Highlightr

class NetworkViewController: UIViewController, LoaderPresentable {
    
    private lazy var codeLabel: UILabel = {
        
        let v = Highlightr()
        v!.setTheme(to: "paraiso-dark")
        
        let lbl = UILabel()
        lbl.attributedText = v?.highlight("""
        APIClient.instance.executeGET(
            endPoint: "articles",
            success: { (response) in
                let articles = Mapper<Article>().mapArray(JSONObject: response.arrayObject) ?? []
            },
            failure: { error in
                // Error Handling
            }
        )
        """, as: "Swift", fastRender: true)
        
        lbl.numberOfLines = 0
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.networkTest()
    }
    
    private func setupUI() {
        self.view.backgroundColor = #colorLiteral(red: 0.1422876716, green: 0.1694026589, blue: 0.1220108792, alpha: 1)
        self.view.addSubview(codeLabel)
        self.codeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
            $0.left.right.equalToSuperview().inset(16)
        }
    }
    
    private func networkTest() {
        
        APIClient.instance.executeGET(endPoint: "articles", success: { (response) in
            let articles = Mapper<Article>().mapArray(JSONObject: response.arrayObject) ?? []
            self.view.makeToast("\(articles.count) Articles downloaded")
            print(#function)
        }, failure: { error in
            self.view.makeToast(error.localizedDescription)
            // TODO: Add alert ctrl util
        })
        
    }
    
}
