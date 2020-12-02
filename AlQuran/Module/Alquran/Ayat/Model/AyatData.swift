//
//  AyatData.swift
//
//  Created by Aprizal on 22/5/20
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public struct AyatData: Decodable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let id = "id"
    static let ar = "ar"
    static let idt = "idt"
  }

  // MARK: Properties
  public var id: [AyatId]?
  public var ar: [AyatAr]?
  public var idt: [AyatIdt]?

  // MARK: SwiftyJSON Initializers
  /// Initiates the instance based on the object.
  ///
  /// - parameter object: The object of either Dictionary or Array kind that was passed.
  /// - returns: An initialized instance of the class.
  public init(object: Any) {
    self.init(json: JSON(object))
  }

  /// Initiates the instance based on the JSON that was passed.
  ///
  /// - parameter json: JSON object from SwiftyJSON.
  public init(json: JSON) {
    if let items = json[SerializationKeys.id].array { id = items.map { AyatId(json: $0) } }
    if let items = json[SerializationKeys.ar].array { ar = items.map { AyatAr(json: $0) } }
    if let items = json[SerializationKeys.idt].array { idt = items.map { AyatIdt(json: $0) } }
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = id { dictionary[SerializationKeys.id] = value.map { $0.dictionaryRepresentation() } }
    if let value = ar { dictionary[SerializationKeys.ar] = value.map { $0.dictionaryRepresentation() } }
    if let value = idt { dictionary[SerializationKeys.idt] = value.map { $0.dictionaryRepresentation() } }
    return dictionary
  }

}
