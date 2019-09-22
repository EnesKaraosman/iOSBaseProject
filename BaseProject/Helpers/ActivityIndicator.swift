//
//  ActivityIndicator.swift
//  BaseProject
//
//  Created by Enes Karaosman on 21.09.2019.
//  Copyright © 2019 Enes Karaosman. All rights reserved.
//

import NVActivityIndicatorView

protocol ActivityIndicatorView: class {
    func startLoading()
    func startLoading(message: String?)
    func stopLoading()
    func setMessage(message: String)
}

extension ActivityIndicatorView {
    
    func startLoading(message: String?) {

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
    
    func startLoading() {
        startLoading(message: nil)
    }
    
    func stopLoading() {
        
        if !NVActivityIndicatorPresenter.sharedInstance.isAnimating {
            return
        }
        
        DispatchQueue.main.async {
            NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
        }
        
    }
    
    func setMessage(message: String) {
        
        if !NVActivityIndicatorPresenter.sharedInstance.isAnimating {
            return
        }
        
        DispatchQueue.main.async {
            NVActivityIndicatorPresenter.sharedInstance.setMessage(message)
        }
        
    }
    
}