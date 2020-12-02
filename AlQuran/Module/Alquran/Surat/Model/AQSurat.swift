//
//  AQSurat.swift
//
//  Created by Aprizal on 16/5/20
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class AQSurat {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let status = "status"
    static let query = "query"
    static let hasil = "hasil"
  }

  // MARK: Properties
  public var status: String?
  public var query: AQQuery?
  public var hasil: [AQHasil]?

  // MARK: SwiftyJSON Initializers
  /// Initiates the instance based on the object.
  ///
  /// - parameter object: The object of either Dictionary or Array kind that was passed.
  /// - returns: An initialized instance of the class.
  public convenience init(object: Any) {
    self.init(json: JSON(object))
  }

  /// Initiates the instance based on the JSON that was passed.
  ///
  /// - parameter json: JSON object from SwiftyJSON.
  public required init(json: JSON) {
    status = json[SerializationKeys.status].string
    query = AQQuery(json: json[SerializationKeys.query])
    if let items = json[SerializationKeys.hasil].array { hasil = items.map { AQHasil(json: $0) } }
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = status { dictionary[SerializationKeys.status] = value }
    if let value = query { dictionary[SerializationKeys.query] = value.dictionaryRepresentation() }
    if let value = hasil { dictionary[SerializationKeys.hasil] = value.map { $0.dictionaryRepresentation() } }
    return dictionary
  }

}
