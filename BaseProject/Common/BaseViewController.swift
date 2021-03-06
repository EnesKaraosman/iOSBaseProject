//
//  BaseViewController.swift
//  BaseProject
//
//  Created by Enes Karaosman on 13.01.2020.
//  Copyright © 2020 Enes Karaosman. All rights reserved.
//

import UIKit
import Toast
import Combine

class BaseViewController<VM: BaseViewModel>: UIViewController {
    
    var cancellable = Set<AnyCancellable>()
    let viewModel: VM
    
    init(viewModel: VM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBinding()
    }
    
    func setupUI() {
        Log.i("BASE: setupUI")
        self.view.backgroundColor = .primaryBackground
    }
    
    func setupBinding() {
        Log.i("BASE: setupBinding")
        
        errorStateBinding()
    }
    
    func errorStateBinding() {
        Log.i("BASE: errorStateBinding")
        
        self.viewModel.error
            .filter { $0.0 != nil }
            .receive(on: RunLoop.main)
            .sink { (output) in
                let (errorMessage, errorPresentationType) = output
                switch errorPresentationType {
                case .alert:
                    self.viewModel.showError(message: errorMessage!)
                case .toast:
                    var errorToastStyle = ToastStyle()
                    errorToastStyle.backgroundColor = UIColor.red.withAlphaComponent(0.7)
                    self.view.makeToast(errorMessage, duration: 2, position: .bottom, title: nil, image: nil, style: errorToastStyle)
                }

            }
            .store(in: &cancellable)

    }

}
