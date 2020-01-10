//
//  ActivityIndicator.swift
//  BaseProject
//
//  Created by Enes Karaosman on 21.09.2019.
//  Copyright © 2019 Enes Karaosman. All rights reserved.
//

import NVActivityIndicatorView

/// Add to any view controller you want. (Single Instance)
protocol ActivityIndicatorView: class {
    func showLoading()
    func showLoading(message: String?)
    func hideLoading()
    func setLoaderMessage(message: String)
}

extension ActivityIndicatorView {
    
    func showLoading(message: String?) {

        if NVActivityIndicatorPresenter.sharedInstance.isAnimating {
            return
        }
        
        let activityData = ActivityData(
            size: .init(width: 40, height: 40),
            message: message,
            messageFont: .boldSystemFont(ofSize: 17),
            messageSpacing: nil,
            type: .ballGridBeat,
            color: .orange,
            padding: nil,
            displayTimeThreshold: nil,
            minimumDisplayTime: nil,
            backgroundColor: #colorLiteral(red: 1, green: 0.8756536828, blue: 0.8383180645, alpha: 0.5043075771),
            textColor: .black
        )
        
        DispatchQueue.main.async {
            NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData)
        }
        
    }
    
    func showLoading() {
        showLoading(message: nil)
    }
    
    func hideLoading() {
        
        if !NVActivityIndicatorPresenter.sharedInstance.isAnimating {
            return
        }
        
        DispatchQueue.main.async {
            NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
        }
        
    }
    
    func setLoaderMessage(message: String) {
        
        if !NVActivityIndicatorPresenter.sharedInstance.isAnimating {
            return
        }
        
        DispatchQueue.main.async {
            NVActivityIndicatorPresenter.sharedInstance.setMessage(message)
        }
        
    }
    
}
