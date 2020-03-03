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
    let route: AppRoute
}

class ExampleViewController: LBTAListController<ExampleTableViewCell, SamplePage>, UICollectionViewDelegateFlowLayout {
    
    var viewModel: ExampleContainerViewModel?
    
    init(viewModel: BaseViewModel) {
       self.viewModel = viewModel as? ExampleContainerViewModel
       super.init()
    }
       
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        items = viewModel!.getSamplePages()
        
        if #available(iOS 13.0, *) {
            let configuration = UIFontPickerViewController.Configuration()
            configuration.includeFaces = true
            let fontPicker = UIFontPickerViewController(configuration: configuration)
            fontPicker.delegate = self
//            items.append(
//                SamplePage(
//                    name: "FontProvider".localized(),
//                    systemIconName: "arrows",
//                    page: UIFontPickerViewController.self,
//                    rawPage: fontPicker
//                )
//            )
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: self.view.frame.width, height: 56)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let page = items[indexPath.row]
        Log.i("\(page.name) tapped")
        DispatchQueue.main.async {
            self.viewModel?.routeSelected(route: page.route)
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
