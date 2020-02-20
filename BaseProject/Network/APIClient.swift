//
//  BaseApiClient.swift
//  BaseProject
//
//  Created by Enes Karaosman on 21.09.2019.
//  Copyright © 2019 Enes Karaosman. All rights reserved.
//

import Alamofire
import SwiftyJSON
import RxSwift
import RxAlamofire

public class APIClient: IAPIClient {
    
    var timoutInterval: TimeInterval = 20
    
    var networkInterceptor: INetworkInterceptor?
    
    static var instance = APIClient(networkInterceptor: MyNetworkInterceptor())
    
    private let sessionManager: SessionManager
    var environment: NetworkEnvironment?
    
    required init(networkInterceptor: INetworkInterceptor?) {
        self.networkInterceptor = networkInterceptor
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = self.timoutInterval
        sessionManager = SessionManager(configuration: configuration)
    }
    
    /// Simply create your request by confirming Request protocol, then execute.
    func execute<T: Request>(
        request: T,
        success: @escaping (T.Response) -> Void,
        failure: @escaping (APIError) -> Void
    ) {
        
        guard let environment = environment, !environment.baseUrl.isEmpty else {
            Log.e("Environment not configured!")
            failure(.custom(message: "Environment not configured!"))
            return
        }
        
        let path = environment.baseUrl.appending(request.endPoint)
        
        guard let parameters = getParameters(request: request) else {
            failure(.custom(message: "Request parameter serialization failed!"))
            return
        }
        
        self.networkInterceptor?.onBeforeRequest()
        var _request = sessionManager.request(
            path,
            method: request.httpMethod,
            parameters: parameters,
            encoding: JSONEncoding.default,
            headers: Session.sharedInstance.getHeaders()
        )
    
        _request = self.networkInterceptor?.onRequest(request: _request) ?? _request
        
        _request
            .validate()
            .responseData { (response) in
                
                self.updateAuthorizationToken(response: response.response)
                self.networkInterceptor?.onRequestComplete(response: response)
                
                switch response.result {
                case .success(let data):
                    let _data = self.networkInterceptor?.onRequestSuccess(data: data) ?? data
                    guard let value = try? JSONDecoder().decode(T.Response.self, from: _data) else {
                        return failure(.custom(message: "Response Serialization Error"))
                    }
                    success(value)
                case .failure(let error):
                    let _error = self.networkInterceptor?.onRequestFailure(error: error) ?? error
                    failure(.network(internal: _error))
                }
        }
        
    }
    
    /// Just feed your endPoint, then parse your JSON response, if not fails :) .
    func executeGET<T: Decodable>(
        endPoint: String,
        success: @escaping (T) -> Void,
        failure: @escaping (APIError) -> Void
    ) {

        guard let environment = environment, !environment.baseUrl.isEmpty else {
            Log.e("Environment not configured!")
            failure(.custom(message: "Environment not configured!"))
            return
        }

        let path = environment.baseUrl.appending(endPoint)

        self.networkInterceptor?.onBeforeRequest()
        var _request = sessionManager.request(
            path,
            method: .get,
            encoding: JSONEncoding.default,
            headers: Session.sharedInstance.getHeaders()
        )
        
        _request = self.networkInterceptor?.onRequest(request: _request) ?? _request
        
        _request
            .validate()
            .responseData(completionHandler: { (response) in
                
                self.updateAuthorizationToken(response: response.response)
                self.networkInterceptor?.onRequestComplete(response: response)

                switch response.result {
                case .success(let data):
                    let _data = self.networkInterceptor?.onRequestSuccess(data: data) ?? data
                    guard let value = try? JSONDecoder().decode(T.self, from: _data) else {
                        return failure(.custom(message: "Response Serialization Error"))
                    }
                    success(value)
                case .failure(let error):
                    let _error = self.networkInterceptor?.onRequestFailure(error: error) ?? error
                    failure(.network(internal: _error))
                }
                
            })

    }
    
    /// Prefer in case you do want to parse JSON manually.
    func executeWithoutMapping<T: Request>(
        request: T,
        success: @escaping (JSON) -> Void,
        failure: @escaping (APIError) -> Void
    ) {

        guard let environment = environment, !environment.baseUrl.isEmpty else {
            Log.e("Environment not configured!")
            failure(.custom(message: "Environment not configured!"))
            return
        }

        let path = environment.baseUrl.appending(request.endPoint)
        
        guard let parameters = getParameters(request: request) else {
            failure(.custom(message: "Request parameter serialization failed!"))
            return
        }

        self.networkInterceptor?.onBeforeRequest()
        var _request = sessionManager.request(
            path,
            method: request.httpMethod,
            parameters: parameters,
            encoding: JSONEncoding.default,
            headers: Session.sharedInstance.getHeaders()
        )
            
        _request = self.networkInterceptor?.onRequest(request: _request) ?? _request
        
        _request
            .validate()
            .responseJSON { responseObject in

                self.networkInterceptor?.onRequestComplete(response: responseObject)
                self.updateAuthorizationToken(response: responseObject.response)

                switch responseObject.result {
                case .success(let value):
                    let json = JSON(value)
                    let _json = self.networkInterceptor?.onRequestSuccess(json: json) ?? json
                    success(_json)
                case .failure(let error):
                    let _error = self.networkInterceptor?.onRequestFailure(error: error) ?? error
                    failure(.network(internal: _error))
                }
        }
    }
    
    private func updateAuthorizationToken(response: HTTPURLResponse?) {
        if let authorization = response?.allHeaderFields["Authorization"] as? String {
            Session.sharedInstance.Authorization = authorization
        }
    }
    
    private func getParameters<T: Request>(request: T) -> [String: Any]? {
        if let data = try? JSONEncoder().encode(request) {
            if let dict = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                return dict
            }
            Log.e("JSONSerialization failed!")
        }
        Log.e("JSONEncoder failed to resolve request!")
        return nil
    }
    
}

// MARK: - Rx version of execute methods.
extension APIClient {
    
    /// Observable (Reactive) version of plain execute method.
    func rx_execute<T: Request>(request: T) -> Observable<T.Response> {

        guard let environment = environment, !environment.baseUrl.isEmpty else {
            Log.e("Environment not configured!")
            return Observable.error(APIError.custom(message: "Environment not configured!"))
        }
        
        let path = environment.baseUrl.appending(request.endPoint)

        guard let parameters = getParameters(request: request) else {
            return Observable.error(APIError.custom(message: "Request parameter serialization failed!"))
        }

        guard let url = URL(string: path) else {
            Log.e("URL is not correct!")
            return Observable.error(APIError.custom(message: "URL is not correct!"))
        }

        return sessionManager.rx.request(
            request.httpMethod,
            url,
            parameters: parameters,
            encoding: JSONEncoding.default,
            headers: Session.sharedInstance.getHeaders()
        )
            .validate()
            .responseData()
            .flatMap({ (response: HTTPURLResponse, data: Data) -> Observable<T.Response> in
                    
                self.updateAuthorizationToken(response: response)
                
                guard let result = try? JSONDecoder().decode(T.Response.self, from: data) else {
                    return .error(APIError.custom(message: "Response Serialization Error"))
                }
                return .just(result)
            })

    }
    
}
