//
//  Request.swift
//  BaseProject
//
//  Created by Enes Karaosman on 21.09.2019.
//  Copyright © 2019 Enes Karaosman. All rights reserved.
//

import ObjectMapper
import Alamofire

protocol Request: Mappable {
    associatedtype Response: Mappable
    var endPoint: String { get set }
    var httpMethod: HTTPMethod { get set }
}
