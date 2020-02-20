//
//  NetworkInterceptor.swift
//  BaseProject
//
//  Created by Enes Karaosman on 20.02.2020.
//  Copyright © 2020 Enes Karaosman. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

public class MyNetworkInterceptor: INetworkInterceptor, LoaderPresentable {
    
    public func onBeforeRequest() {
        Log.i("")
        self.showLoading()
    }
    
    public func onRequest(request: DataRequest) -> DataRequest {
        Log.i("")
        return request
    }
    
    public func onRequestSuccess(data: Data) -> Data {
        Log.i("")
        return data
    }
    
    public func onRequestSuccess(json: JSON) -> JSON {
        Log.i("")
        return json
    }
    
    public func onRequestFailure(error: Error) -> Error {
        Log.e("")
        return error
    }
    
    public func onRequestComplete(response: DataResponse<Data>) {
        Log.i("")
        self.hideLoading()
    }
    
    public func onRequestComplete(response: DataResponse<Any>) {
        Log.i("")
        self.hideLoading()
    }
    
}
