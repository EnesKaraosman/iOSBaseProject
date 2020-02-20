//
//  NetworkClientProtocol.swift
//  BaseProject
//
//  Created by Enes Karaosman on 11.02.2020.
//  Copyright © 2020 Enes Karaosman. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

protocol IAPIClient: class {
    
    var timoutInterval: TimeInterval { get }
    
    var networkInterceptor: INetworkInterceptor? { get set }
    
    func execute<T: Request>(
        request: T,
        success: @escaping (T.Response) -> Void,
        failure: @escaping (APIError) -> Void
    )
    
    func executeGET<T: Decodable>(
        endPoint: String,
        success: @escaping (T) -> Void,
        failure: @escaping (APIError) -> Void
    )
    
    func executeWithoutMapping<T: Request>(
        request: T,
        success: @escaping (JSON) -> Void,
        failure: @escaping (APIError) -> Void
    )
    
    init(networkInterceptor: INetworkInterceptor?)

}
