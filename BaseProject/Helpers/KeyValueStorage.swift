//
//  KeyValueStorage.swift
//  BaseProject
//
//  Created by Enes Karaosman on 7.01.2020.
//  Copyright © 2020 Enes Karaosman. All rights reserved.
//

import Foundation

/*
 Usage:
 
 struct AppData {
     @KeyValueStorage("user_name", defaultValue: "")
     static var userName: String
 }
 
 AppData.userName // ""
 AppData.userName = "Enes"
 AppData.userName // "Enes"

 **/


@propertyWrapper
struct KeyValueStorage<T: Codable> {
    
    let key: String
    let defaultValue: T
    
    init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: T {
        get {
            guard let data = UserDefaults.standard.object(forKey: key) as? Data else {
                return defaultValue
            }
            let value = try? JSONDecoder().decode(T.self, from: data)
            return value ?? defaultValue
        }
        set {
            let data = try? JSONEncoder().encode(newValue)
            UserDefaults.standard.set(data, forKey: key)
            UserDefaults.standard.synchronize()
        }
    }
    
}



