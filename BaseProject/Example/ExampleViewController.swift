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
                rawPage: NetworkViewController(
                    viewModel: BaseViewModel(api: APIClient.instance)
                )
            ),
            SamplePage(
                name: "Generic ListController".localized(),
                systemIconName: "arrows",
                page: GenericListController.self,
                rawPage: GenericListController(
                    viewModel: GenericListViewModel(api: APIClient.instance)
                )
            ),
            SamplePage(
                name: "Template Controller".localized(),
                systemIconName: "arrows",
                page: TemplateViewController.self,
                rawPage: TemplateBuilder.build()
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
