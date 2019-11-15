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
import LBTATools

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
// Localization ✅ (Consider using SwiftGen, autogenerated localization strings https://github.com/SwiftGen/SwiftGen)
// Styler (TextStyle, FontManager)
// Reusable (Identifiable)
// Loading Indicator integration ✅
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
    let rawPage: UIViewController
}

class ExampleViewController: LBTAListController<ExampleTableViewCell, SamplePage>, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        items = [
            SamplePage(
                name: "Network".localized(),
                systemIconName: "network",
                page: NetworkViewController.self,
                rawPage: NetworkViewController()
            ),
            SamplePage(
                name: "Generic ListController".localized(),
                systemIconName: "arrows",
                page: GenericListController.self,
                rawPage: GenericListController()
            )
        ]
        
        if #available(iOS 13.0, *) {
            let configuration = UIFontPickerViewController.Configuration()
            configuration.includeFaces = true
            let fontPicker = UIFontPickerViewController(configuration: configuration)
            fontPicker.delegate = self
            items.append(
                SamplePage(
                    name: "FontProvider".localized(),
                    systemIconName: "arrows",
                    page: UIFontPickerViewController.self,
                    rawPage: fontPicker
                )
            )
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: self.view.frame.width, height: 56)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let page = items[indexPath.row]
        Log.i("\(page.name) tapped")
        DispatchQueue.main.async {
            let nv = UINavigationController(rootViewController: page.rawPage)
            // let nv = UINavigationController(rootViewController: value.page.init())
            self.present(nv, animated: true, completion: nil)
        }
    }
    
}


@available(iOS 13.0, *)
extension ExampleViewController: UIFontPickerViewControllerDelegate {
    func fontPickerViewControllerDidPickFont(_ viewController: UIFontPickerViewController) {
        guard let fontDescriptor = viewController.selectedFontDescriptor else { return }
        print(fontDescriptor)
    }
}
