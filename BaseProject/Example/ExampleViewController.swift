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
        
        self.collectionView.theme_backgroundColor = GlobalPicker.backgroundColor
        
        items = viewModel!.getSamplePages()
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
