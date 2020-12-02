//
//  JSQuery.swift
//
//  Created by Aprizal on 1/5/20
//  Copyright (c) Alquran. All rights reserved.
//

import Foundation
import SwiftyJSON

public final class JSQuery {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let kota = "kota"
    static let format = "format"
    static let tanggal = "tanggal"
  }

  // MARK: Properties
  public var kota: String?
  public var format: String?
  public var tanggal: String?

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
    kota = json[SerializationKeys.kota].string
    format = json[SerializationKeys.format].string
    tanggal = json[SerializationKeys.tanggal].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = kota { dictionary[SerializationKeys.kota] = value }
    if let value = format { dictionary[SerializationKeys.format] = value }
    if let value = tanggal { dictionary[SerializationKeys.tanggal] = value }
    return dictionary
  }

}
