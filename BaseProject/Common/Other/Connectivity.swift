//
//  ReachabilityManager.swift
//  BaseProject
//
//  Created by Enes Karaosman on 9.01.2020.
//  Copyright © 2020 Enes Karaosman. All rights reserved.
//

import UIKit
import Alamofire
// If you dont want this helper class to depend on Alamofire, find new one :D
// You can switch to this one https://github.com/ashleymills/Reachability.swift

class Connectivity: NSObject {
    
    let manager = NetworkReachabilityManager()
    static let shared = Connectivity()
    
    var isConnectedToInternet: Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
    
    var listener: NetworkReachabilityManager.Listener? = nil {
        didSet {
            if let listener = self.listener {
                manager?.startListening(onUpdatePerforming: listener)
            }
        }
    }
    
    override private init() { }
    
}

extension Connectivity: UIApplicationDelegate {
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {

        Connectivity.shared.listener = { state in
            guard let nv = UIApplication.shared.windows.first?.rootViewController as? UINavigationController else { return }
            nv.viewControllers.first?.view.makeToast(
                Connectivity.shared.isConnectedToInternet ? "Connected to Internet".localized() : "Internet Connection Lost".localized()
            )
        }
        Log.i("ConnectivityAppDelegate didFinishLaunchingWithOptions")
        
        return true
    }
    
}

/*
 Usage Sample
 
 if Connectivity.shared.isConnectedToInternet {
    //
 }
 
 Connectivity.shared.listener = { [weak self] status in
     guard self != nil else { return }
     Log.i(status)
 }
 */
