//
//  AyatBahasa.swift
//
//  Created by Aprizal on 22/5/20
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public struct AyatBahasa: Decodable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let keterangan = "keterangan"
    static let proses = "proses"
  }

  // MARK: Properties
  public var keterangan: [String]?
  public var proses: [String]?

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
    if let items = json[SerializationKeys.keterangan].array { keterangan = items.map { $0.stringValue } }
    if let items = json[SerializationKeys.proses].array { proses = items.map { $0.stringValue } }
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = keterangan { dictionary[SerializationKeys.keterangan] = value }
    if let value = proses { dictionary[SerializationKeys.proses] = value }
    return dictionary
  }

}
