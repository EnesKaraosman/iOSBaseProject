//
//  ViewController.swift
//  BaseProject
//
//  Created by Enes Karaosman on 20.09.2019.
//  Copyright © 2019 Enes Karaosman. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

// TODO's

// MARK: - Network
/// Network (Rx, Plain), JSON Parsing (ObjectMapper, SwiftyJSON, Default JSONDecoder)
/// Consider using enumeration cases for api (service interfaces) ref: ios-base-swift-master/Services
/// You can track network activities with Bagel framework

// MARK: - Design Pattern
/// Design Pattern (MVP, MVVM),
/// Coordinator (XCoordinator) For presenting ViewController, consider bottom popup to reflect iOS 13's default behaviour
/// Leave at least one example in this project for design patterns

// MARK: - Database
// Local Database (Realm, NSUserDefault-ForBasicThings)

// MARK: - Helper, Util
// Logger (May be used with analitycs services) ✅
// Localization
// Styler (TextStyle, FontManager)
// Reusable (Identifiable)
// Loading Indicator integration
// Extensions
// Bottom bar vc, PagerStripVC
// Constants
// Configuration File (May include all primary fonts, colors, urls.. ?)

/// BaseClasses, BaseComponents (BaseViews, Dark mode support)
/// Component Factory (UI components)


struct SamplePage {
    let name: String
    let systemIconName: String
    let page: UIViewController.Type
}

class ExampleViewController: UIViewController, UITableViewDelegate, Identifiable {
    
    let samplePages = Observable.just([
        SamplePage(
            name: "Network".localized(),
            systemIconName: "network",
            page: NetworkViewController.self
        ),
        SamplePage(
            name: "Generic TableViewController".localized(),
            systemIconName: "arrows",
            page: GenericDemoController.self
        )
    ])

    let disposeBag = DisposeBag()
    
    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.register(ExampleTableViewCell.self, forCellReuseIdentifier: "SampleCell")
        tv.tableFooterView = UIView()
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { $0.edges.equalToSuperview() }
        
        samplePages
            .bind(to: tableView.rx.items(cellIdentifier: "SampleCell", cellType: ExampleTableViewCell.self)) { (row, element, cell) in
                cell.setCell(sampleView: element)
                cell.selectionStyle = .none
            }
            .disposed(by: disposeBag)
        
        tableView.rx
            .modelSelected(SamplePage.self)
            .subscribe(onNext:  { value in
                Log.i("\(value.name) tapped")
                DispatchQueue.main.async {
                    let nv = UINavigationController(rootViewController: value.page.init())
                    self.present(nv, animated: true, completion: nil)
                }
            })
            .disposed(by: disposeBag)
        
    }

}
