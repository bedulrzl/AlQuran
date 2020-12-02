//
//  AyatQuery.swift
//
//  Created by Aprizal on 22/5/20
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public struct AyatQuery: Decodable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let surat = "surat"
    static let ayat2 = "ayat2"
    static let ayat = "ayat"
    static let format = "format"
    static let bahasa2 = "bahasa2"
    static let bahasa = "bahasa"
  }

  // MARK: Properties
  public var surat: String?
  public var ayat2: [Int]?
  public var ayat: String?
  public var format: String?
  public var bahasa2: [String]?
  public var bahasa: String?

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
    if let items = json[SerializationKeys.ayat2].array { ayat2 = items.map { $0.intValue } }
    ayat = json[SerializationKeys.ayat].string
    format = json[SerializationKeys.format].string
    if let items = json[SerializationKeys.bahasa2].array { bahasa2 = items.map { $0.stringValue } }
    bahasa = json[SerializationKeys.bahasa].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = surat { dictionary[SerializationKeys.surat] = value }
    if let value = ayat2 { dictionary[SerializationKeys.ayat2] = value }
    if let value = ayat { dictionary[SerializationKeys.ayat] = value }
    if let value = format { dictionary[SerializationKeys.format] = value }
    if let value = bahasa2 { dictionary[SerializationKeys.bahasa2] = value }
    if let value = bahasa { dictionary[SerializationKeys.bahasa] = value }
    return dictionary
  }

}
