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
    func startActivityIndicatorLoading()
    func startActivityIndicatorLoading(message: String?)
    func stopActivityIndicatorLoading()
    func setActivityIndicatorMessage(message: String)
}

extension ActivityIndicatorView {
    
    func startActivityIndicatorLoading(message: String?) {

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
            backgroundColor: .lightGray,
            textColor: .black
        )
        
        DispatchQueue.main.async {
            NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData)
        }
        
    }
    
    func startActivityIndicatorLoading() {
        startActivityIndicatorLoading(message: nil)
    }
    
    func stopActivityIndicatorLoading() {
        
        if !NVActivityIndicatorPresenter.sharedInstance.isAnimating {
            return
        }
        
        DispatchQueue.main.async {
            NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
        }
        
    }
    
    func setActivityIndicatorMessage(message: String) {
        
        if !NVActivityIndicatorPresenter.sharedInstance.isAnimating {
            return
        }
        
        DispatchQueue.main.async {
            NVActivityIndicatorPresenter.sharedInstance.setMessage(message)
        }
        
    }
    
}
