//
//  INetworkInterceptor.swift
//  BaseProject
//
//  Created by Enes Karaosman on 20.02.2020.
//  Copyright © 2020 Enes Karaosman. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

public protocol INetworkInterceptor {
    func onBeforeRequest()
    func onRequest(request: DataRequest) -> DataRequest

    func onRequestSuccess(data: Data) -> Data //
    func onRequestSuccess(json: JSON) -> JSON // Without mapping

    func onRequestFailure(error: Error) -> Error

    func onRequestComplete(response: DataResponse<Data>)
    func onRequestComplete(response: DataResponse<Any>)
}
