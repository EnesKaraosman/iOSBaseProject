//
//  TemplateViewController.swift
//  BaseProject
//
//  Created by Enes Karaosman on 13.01.2020.
//  Copyright © 2020 Enes Karaosman. All rights reserved.
//

import UIKit
import SnapKit

class TemplateViewController: UIViewController {

    var viewModel: TemplateViewModel?
    
    private lazy var descriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = """
        1) Put related template (MVVM Files.xctemplate) to path /Developer/Xcode/Templates
        
        2) Here it exists in this folder (. Then create new file (search for MVVM) using related template.
        
        3) Then name your module, that's it.
        
        4) Also make sure dependent files exist (it dependends on some classes like APIClient, BaseViewModel etc.)
        """
        lbl.numberOfLines = 0
        return lbl
    }()
    
    init(viewModel: BaseViewModel) {
        self.viewModel = viewModel as? TemplateViewModel
        super.init(nibName: nil, bundle: nil)
        
        self.view.addSubview(descriptionLabel)
        self.descriptionLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(Spacing.small)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.2641104293, green: 0.6212216815, blue: 0.9411764741, alpha: 1)
    }
    
}
