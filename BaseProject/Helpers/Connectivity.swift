//
//  ReachabilityManager.swift
//  BaseProject
//
//  Created by Enes Karaosman on 9.01.2020.
//  Copyright © 2020 Enes Karaosman. All rights reserved.
//

import Alamofire
// If you dont want this helper class to depend on Alamofire, find new one :D
// You can switch to this one https://github.com/ashleymills/Reachability.swift

class Connectivity {
    
    let manager = NetworkReachabilityManager()
    static let shared = Connectivity()
    
    var isConnectedToInternet: Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
    
    var listener: NetworkReachabilityManager.Listener? = nil {
        didSet {
            manager?.listener = self.listener
            manager?.startListening()
        }
    }
    
    private init() {
        
    }
    
}

/**
 Usage Sample
 
 if Connectivity.shared.isConnectedToInternet {
    //
 }
 
 Connectivity.shared.listener = { [weak self] status in
     guard self != nil else { return }
     Log.i(status)
 }
 */
