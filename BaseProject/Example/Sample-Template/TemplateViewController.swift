//
//  TemplateViewController.swift
//  BaseProject
//
//  Created by Enes Karaosman on 13.01.2020.
//  Copyright © 2020 Enes Karaosman. All rights reserved.
//

import UIKit

class TemplateViewController: BaseViewController<TemplateViewModel> {
    
    private lazy var descriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.attributedText = NSMutableAttributedString()
            .appendText(text: "1)", withFont: .boldSystemFont(ofSize: 20), withColor: .purple)
            .appendText(
                text: " Put related template (MVVM Files.xctemplate) to path /Developer/Xcode/Templates (appropriate template exist in this folder.\n\n",
                withFont: .systemFont(ofSize: 20, weight: .regular),
                withColor: .black
            )
            .appendText(text: "2)", withFont: .boldSystemFont(ofSize: 20), withColor: .purple)
            .appendText(
                text: " Then create new file (search for MVVM) using related template.\n\n",
                withFont: .systemFont(ofSize: 20, weight: .regular),
                withColor: .black
            )
            .appendText(text: "3)", withFont: .boldSystemFont(ofSize: 20), withColor: .purple)
            .appendText(
                text: " Then name your module, that's it.\n\n",
                withFont: .systemFont(ofSize: 20, weight: .regular),
                withColor: .black
            )
            .appendText(text: "4)", withFont: .boldSystemFont(ofSize: 20), withColor: .purple)
            .appendText(
                text: " Also make sure dependent files exist (it dependends on some classes like APIClient, BaseViewModel etc.)\n\n",
                withFont: .systemFont(ofSize: 20, weight: .regular),
                withColor: .black
            )
        lbl.numberOfLines = 0
        return lbl
    }()
    
    override func setupUI() {
        super.setupUI()
        
        self.view.backgroundColor = #colorLiteral(red: 0.2641104293, green: 0.6212216815, blue: 0.9411764741, alpha: 1)
        
        self.view.addSubview(descriptionLabel)
        self.descriptionLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(Spacing.small)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.2641104293, green: 0.6212216815, blue: 0.9411764741, alpha: 1)
    }
    
}
