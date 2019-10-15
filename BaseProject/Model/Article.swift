//
//  Article.swift
//
//  Created by Enes Karaosman on 14.10.2019
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class Article: Mappable, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let avatar = "avatar"
    static let name = "name"
    static let id = "id"
    static let createdAt = "createdAt"
  }

  // MARK: Properties
  public var avatar: String?
  public var name: String?
  public var id: String?
  public var createdAt: String?

  // MARK: ObjectMapper Initializers
  /// Map a JSON object to this class using ObjectMapper.
  ///
  /// - parameter map: A mapping from ObjectMapper.
  public required init?(map: Map){

  }

  /// Map a JSON object to this class using ObjectMapper.
  ///
  /// - parameter map: A mapping from ObjectMapper.
  public func mapping(map: Map) {
    avatar <- map[SerializationKeys.avatar]
    name <- map[SerializationKeys.name]
    id <- map[SerializationKeys.id]
    createdAt <- map[SerializationKeys.createdAt]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = avatar { dictionary[SerializationKeys.avatar] = value }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.avatar = aDecoder.decodeObject(forKey: SerializationKeys.avatar) as? String
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.createdAt = aDecoder.decodeObject(forKey: SerializationKeys.createdAt) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(avatar, forKey: SerializationKeys.avatar)
    aCoder.encode(name, forKey: SerializationKeys.name)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(createdAt, forKey: SerializationKeys.createdAt)
  }

}
