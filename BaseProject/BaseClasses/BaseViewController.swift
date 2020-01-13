//
//  BaseViewController.swift
//  BaseProject
//
//  Created by Enes Karaosman on 13.01.2020.
//  Copyright © 2020 Enes Karaosman. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class BaseViewController<VM: BaseViewModel>: UIViewController {
    
    var disposeBag = DisposeBag()
    var viewModel: VM?
    
    init(viewModel: VM? = nil) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBinding()
    }
    
    func setupUI() {
        Log.i("BASE: setupUI")
    }
    
    func setupBinding() {
        Log.i("BASE: setupBinding")
    }

}
