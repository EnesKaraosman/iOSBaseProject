//
//  Request.swift
//  BaseProject
//
//  Created by Enes Karaosman on 21.09.2019.
//  Copyright © 2019 Enes Karaosman. All rights reserved.
//

import Alamofire

protocol Request: Codable {
    associatedtype Response: Codable
    var endPoint: String { get set }
    var httpMethod: HTTPMethod { get set }
}
