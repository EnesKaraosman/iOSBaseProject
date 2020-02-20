//
//  Error.swift
//  BaseProject
//
//  Created by Enes Karaosman on 21.09.2019.
//  Copyright © 2019 Enes Karaosman. All rights reserved.
//

import Foundation

public enum APIError: Error {
    case serialization( message: String )
    case network(internal: Error)
    case custom( message: String )
}
