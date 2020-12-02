//
//  AyatModel.swift
//
//  Created by Aprizal on 22/5/20
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public struct AyatModel: Decodable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let surat = "surat"
    static let status = "status"
    static let query = "query"
    static let ayat = "ayat"
    static let bahasa = "bahasa"
  }

  // MARK: Properties
  public var surat: AyatSurat?
  public var status: String?
  public var query: AyatQuery?
  public var ayat: AyatAyat?
  public var bahasa: AyatBahasa?

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
    surat = AyatSurat(json: json[SerializationKeys.surat])
    status = json[SerializationKeys.status].string
    query = AyatQuery(json: json[SerializationKeys.query])
    ayat = AyatAyat(json: json[SerializationKeys.ayat])
    bahasa = AyatBahasa(json: json[SerializationKeys.bahasa])
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = surat { dictionary[SerializationKeys.surat] = value.dictionaryRepresentation() }
    if let value = status { dictionary[SerializationKeys.status] = value }
    if let value = query { dictionary[SerializationKeys.query] = value.dictionaryRepresentation() }
    if let value = ayat { dictionary[SerializationKeys.ayat] = value.dictionaryRepresentation() }
    if let value = bahasa { dictionary[SerializationKeys.bahasa] = value.dictionaryRepresentation() }
    return dictionary
  }

}
