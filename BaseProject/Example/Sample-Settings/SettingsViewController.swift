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
        sv.backgroundColor = .clear
        sv.addRow(self.languageRow)
        sv.setInset(forRow: self.languageRow, inset: .small_all_edges)
        sv.addRow(self.themeRow)
        sv.setInset(forRow: self.themeRow, inset: .small_all_edges)
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
            
            Localize.availableLanguages().filter { $0 != "Base" }.forEach { language in
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
    
    private lazy var themeRow: SelectionRow = {
        let row = SelectionRow()
        row.titleLabel.text = "Theme".localized()
        row.valueLabel.text = MyThemes.current.title
        row.tapHandler = { [weak self] in
            
            let actionSheet = UIAlertController(
                title: "Theme".localized(),
                message: "Choose preferred theme".localized(),
                preferredStyle: UIAlertController.Style.actionSheet
            )
            
            MyThemes.allCases.forEach { theme in
                actionSheet.addAction(.init(title: theme.title, style: .default, handler: { (action) in
                    row.valueLabel.text = theme.title
                    MyThemes.switchTo(theme: theme)
                }))
            }
            actionSheet.addAction(.init(title: "Cancel".localized(), style: .cancel, handler: nil))
            
            self?.present(actionSheet, animated: true, completion: nil)
        }
        return row
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.theme_backgroundColor = GlobalPicker.backgroundColor
    }
    
    override func setupUI() {
        super.setupUI()
        
        self.view.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(Spacing.tiny)
        }
        
    }
    
}

class SelectionRow: CommonView {
    
    lazy var titleLabel = CommonLabel()
    
    lazy var valueLabel: CommonLabel = {
        let lbl = CommonLabel()
        lbl.font = .init(.body, .semiBold)
        return lbl
    }()
    
    override func commonInit() {
        super.commonInit()

        hstack(titleLabel, UIView(), valueLabel)
    }
    
}
