//
//  Article.swift
//
//  Created by Enes Karaosman on 14.10.2019
//  Copyright (c) . All rights reserved.
//

import Foundation

class Article: Codable {
    
    var avatar: String?
    var name: String?
    var id: String?
    var createdAt: String?
    
    public init(name: String, avatar: String) {
        self.name = name
        self.avatar = avatar
    }
    
}
