//
//  BaseApiClient.swift
//  BaseProject
//
//  Created by Enes Karaosman on 21.09.2019.
//  Copyright © 2019 Enes Karaosman. All rights reserved.
//

import ObjectMapper
import Alamofire
import SwiftyJSON
import RxSwift
import RxAlamofire

class APIClient: LoaderPresentable {
    
    static var instance = APIClient()
    private let sessionManager: SessionManager
    var environment: NetworkEnvironment?
    var printNetworkActivity = true
    
    private init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 280
        sessionManager = SessionManager(configuration: URLSessionConfiguration.default)
    }
    
    /// Simply create your request by confirming Request protocol, then execute.
    func execute<T>(
        request: T,
        success: @escaping (T.Response) -> Void,
        failure: @escaping (APIError) -> Void
    ) where T : Request {
        
        guard let environment = environment, environment.baseUrl.isEmpty == false else {
            Log.e("Environment not configured!")
            return
        }
        
        let path = environment.baseUrl.appending(request.endPoint)
        let parameters = Mapper<T>().toJSON(request)
        
        self.handleRequestPrinting(request: request)
        
        self.showLoading()
        sessionManager.request(
            path,
            method: request.httpMethod,
            parameters: parameters.isEmpty ? nil : parameters,
            encoding: JSONEncoding.default,
            headers: Session.sharedInstance.getHeaders()
        )
            .validate()
            .responseJSON { responseObject in
                
                self.handleResponsePrinting(responseObject: responseObject)
                self.hideLoading()
                self.updateAuthorizationToken(response: responseObject.response)
                
                switch responseObject.result {
                case .success(let value):
                    let json = JSON(value)
                    guard let result = Mapper<T.Response>().map(JSONObject: json.object) else {
                        failure(.serialization(message: "Response Serialization Error"))
                        return
                    }
                    success(result)
                case .failure(let error):
                    failure(.network(internal: error))
                }
                
        }
        
    }
    
    /// Just feed your endPoint, then parse your JSON response, if not fails :) .
    func executeGET(
        endPoint: String,
        success: @escaping (JSON) -> Void,
        failure: @escaping (APIError) -> Void
    ) {
        
        guard let environment = environment, environment.baseUrl.isEmpty == false else {
            Log.e("Environment not configured!")
            return
        }
        
        let path = environment.baseUrl.appending(endPoint)
        
        self.handleGetRequestPrinting(endPoint: endPoint)
        
        self.showLoading()
        sessionManager.request(
            path,
            method: .get,
            encoding: JSONEncoding.default,
            headers: Session.sharedInstance.getHeaders()
        )
            .responseJSON { responseObject in
                
                self.handleResponsePrinting(responseObject: responseObject)
                self.hideLoading()
                self.updateAuthorizationToken(response: responseObject.response)
                
                switch responseObject.result {
                case .success(let value):
                    let json = JSON(value)
                    success(json)
                case .failure(let error):
                    failure(.network(internal: error))
                }
                
        }
        
    }
    
    /// Prefer in case you do want to parse Json manually.
    func executeWithoutMapping<T: Request>(
        request: T,
        success: @escaping (JSON) -> Void,
        failure: @escaping (APIError) -> Void
    ) {
        
        guard let environment = environment, environment.baseUrl.isEmpty == false else {
            Log.e("Environment not configured!")
            return
        }
        
        let path = environment.baseUrl.appending(request.endPoint)
        let parameters = Mapper<T>().toJSON(request)
        
        self.handleRequestPrinting(request: request)
        self.showLoading()
        sessionManager.request(
            path,
            method: request.httpMethod,
            parameters: parameters.isEmpty ? nil : parameters,
            encoding: JSONEncoding.default,
            headers: Session.sharedInstance.getHeaders()
        )
            .responseJSON { responseObject in
                
                self.handleResponsePrinting(responseObject: responseObject)
                self.hideLoading()
                self.updateAuthorizationToken(response: responseObject.response)
                
                switch responseObject.result {
                case .success(let value):
                    let json = JSON(value)
                    success(json)
                case .failure(let error):
                    failure(.network(internal: error))
                }
        }
    }
    
    private func updateAuthorizationToken(response: HTTPURLResponse?) {
        if let authorization = response?.allHeaderFields["Authorization"] as? String {
            Session.sharedInstance.Authorization = authorization
        }
    }
    
}

// MARK: - Rx version of execute methods.
extension APIClient {
    
    /// Observable (Reactive) version of plain execute method.
    func rx_execute<T: Request>(request: T) -> Observable<T.Response> {
        
        guard let environment = environment, environment.baseUrl.isEmpty == false else {
            Log.e("Environment not configured!")
            return Observable.error(APIError.custom(message: "Environment not configured!"))
        }
        
        let parameters = Mapper<T>().toJSON(request)
        let path = environment.baseUrl.appending(request.endPoint)
        
        guard let url = URL(string: path) else {
            Log.e("URL is not correct!")
            return Observable.error(APIError.custom(message: "URL is not correct!"))
        }
        
        self.handleRequestPrinting(request: request)
        self.showLoading()
        return sessionManager.rx.request(
            request.httpMethod,
            url,
            parameters: parameters,
            encoding: JSONEncoding.default,
            headers: Session.sharedInstance.getHeaders()
        )
            .validate()
            .responseJSON()
            .flatMap { (responseObject: DataResponse<Any>) -> Observable<T.Response> in
                
                self.handleResponsePrinting(responseObject: responseObject)
                self.hideLoading()
                self.updateAuthorizationToken(response: responseObject.response)
                
                switch responseObject.result {
                    
                case .success(let value):
                    
                    let json = JSON(value)
                    
                    guard let result = Mapper<T.Response>().map(JSONObject: json.object) else {
                        return Observable.error(
                            APIError.serialization(message: "Response Serialization Error")
                        )
                    }
                    
                    return Observable.just(result)
                    
                case .failure(let error):
                    return Observable.error(APIError.network(internal: error))
                }
                
        }
        
    }
    
}

// MARK: - Network Activity Logger
extension APIClient {
    
    private func handleGetRequestPrinting(endPoint: String) {
        if !self.printNetworkActivity { return }
        
        Log.d("NETWORK REQUEST")
        debugPrint("==========================================")
        debugPrint("GET: \(environment!.baseUrl.appending(endPoint))")
        debugPrint("==========================================")
        
    }
    
    private func handleRequestPrinting<T: Request>(request: T) {
        if !self.printNetworkActivity { return }
        
        Log.d("NETWORK REQUEST")
        debugPrint("==========================================")
        debugPrint("\(request.endPoint.uppercased()): \(environment!.baseUrl.appending(request.endPoint))")
        debugPrint(request.toJSONString(prettyPrint: true) ?? "")
        debugPrint("==========================================")
    }
    
    private func handleResponsePrinting(responseObject: DataResponse<Any>) {
        if !self.printNetworkActivity { return }
        
        Log.d("NETWORK RESPONSE")
        debugPrint("==========================================")
        if let response = responseObject.response {
            debugPrint("HEADERS: \(response.allHeaderFields)")
        }
        switch responseObject.result {
        case .success(let value):
            let json = JSON(value)
            debugPrint("== SUCCESS RESULT ==")
            debugPrint(json.rawString(.utf8, options: .init(rawValue: 0)) ?? "")
        case .failure(let error):
            debugPrint("== FAILURE RESULT ==")
            debugPrint(error.localizedDescription)
        }
        debugPrint("==========================================")
    }
    
}
