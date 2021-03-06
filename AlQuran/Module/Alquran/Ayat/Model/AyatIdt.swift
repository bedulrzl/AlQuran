//
//  AyatIdt.swift
//
//  Created by Aprizal on 22/5/20
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public struct AyatIdt: Decodable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let surat = "surat"
    static let ayat = "ayat"
    static let teks = "teks"
    static let id = "id"
  }

  // MARK: Properties
  public var surat: String?
  public var ayat: String?
  public var teks: String?
  public var id: String?

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
    surat = json[SerializationKeys.surat].string
    ayat = json[SerializationKeys.ayat].string
    teks = json[SerializationKeys.teks].string
    id = json[SerializationKeys.id].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = surat { dictionary[SerializationKeys.surat] = value }
    if let value = ayat { dictionary[SerializationKeys.ayat] = value }
    if let value = teks { dictionary[SerializationKeys.teks] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    return dictionary
  }

}
