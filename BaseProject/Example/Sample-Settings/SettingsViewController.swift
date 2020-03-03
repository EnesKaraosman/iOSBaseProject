//
//  SettingsViewController.swift
//  BaseProject
//
//  Created by Enes Karaosman on 2.03.2020.
//  Copyright © 2020 Enes Karaosman. All rights reserved.
//

import UIKit
import AloeStackView
import LBTATools
import Localize_Swift
import Toast_Swift

class SettingsViewController: BaseViewController<SettingsViewModel> {
    
    private lazy var stackView: AloeStackView = {
        let sv = AloeStackView()
        sv.addRow(self.languageRow)
        sv.setInset(forRow: self.languageRow, inset: .small_all_edges)
        return sv
    }()
    
    private lazy var languageRow: SelectionRow = {
        let row = SelectionRow()
        row.titleLabel.text = "Language".localized()
        row.valueLabel.text = Localize.currentLanguage()
        row.tapHandler = { [weak self] in
            
            let actionSheet = UIAlertController(
                title: "Language".localized(),
                message: "Choose preferred language".localized(),
                preferredStyle: UIAlertController.Style.actionSheet
            )
            
            Localize.availableLanguages().filter{ $0 != "Base" }.forEach { language in
                actionSheet.addAction(.init(title: language, style: .default, handler: { (action) in
                    row.valueLabel.text = language
                    Localize.setCurrentLanguage(language)
                    self?.view.makeToast("To apply changes restart app!".localized())
                }))
            }
            actionSheet.addAction(.init(title: "Cancel".localized(), style: .cancel, handler: nil))
            
            self?.present(actionSheet, animated: true, completion: nil)
        }
        return row
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.2641104293, green: 0.6212216815, blue: 0.9411764741, alpha: 1)
    }
    
    override func setupUI() {
        super.setupUI()
        
        self.view.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(Spacing.tiny)
        }
        
    }
    
    override func setupBinding() {
        super.setupBinding()
        // TODO: You can bind viewModel parameters here.
    }
    
}

class SelectionRow: UIView {
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .monospacedSystemFont(ofSize: 18, weight: .semibold)
        return lbl
    }()
    
    lazy var valueLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .monospacedSystemFont(ofSize: 18, weight: .bold)
        return lbl
    }()
    
    var tapHandler: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    @objc private func selfTapped() {
        self.tapHandler?()
    }
    
    func commonInit() {
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(selfTapped))
        self.addGestureRecognizer(tapGR)
        
        hstack(titleLabel, UIView(), valueLabel)
    }
    
}
