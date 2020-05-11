//
//  TemplateViewController.swift
//  BaseProject
//
//  Created by Enes Karaosman on 13.01.2020.
//  Copyright © 2020 Enes Karaosman. All rights reserved.
//

import UIKit

class TemplateViewController: BaseViewController<TemplateViewModel> {
    
    private lazy var descriptionLabel: CommonLabel = {
        return CommonLabel()
            .setText(text: """
            1) Put related template (MVVM Files.xctemplate) to path /Developer/Xcode/Templates (appropriate template exist in project).
            
            2) Then create new file (search for MVVM) using related template.
            
            3) Then name your module, that's it.
            
            4) Also make sure dependent files/modules exist (it dependends on some classes like APIClient, BaseViewModel etc.)
         """)
            .makeMultiline()
        
    }()
    
    override func setupUI() {
        super.setupUI()
    
        self.view.addSubview(descriptionLabel)
        self.descriptionLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(Spacing.small)
        }
    }
    
}
