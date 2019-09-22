//
//  Session.swift
//  BaseProject
//
//  Created by Enes Karaosman on 22.09.2019.
//  Copyright © 2019 Enes Karaosman. All rights reserved.
//

import Foundation

class Session {
    
    static let sharedInstance = Session()
    
    var Authorization: String? = ""
    var userName: String = "" // Taken from Auth service
    
    func getHeaders() -> [String: String] {
        let headers = [
            "Authorization": self.Authorization ?? "",
            "Content-Type": "application/json"
        ]
        
        return headers
    }
    
    private init() { }
    
}
