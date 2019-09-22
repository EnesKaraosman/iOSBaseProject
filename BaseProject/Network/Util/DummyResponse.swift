//
//  DummyResponse.swift
//  BaseProject
//
//  Created by Enes Karaosman on 22.09.2019.
//  Copyright © 2019 Enes Karaosman. All rights reserved.
//

import ObjectMapper

/// You may use with executeWithoutMapping method of APIClient
struct DummyResponse: Mappable {
    init?(map: Map) {}
    mutating func mapping(map: Map) {}
}
