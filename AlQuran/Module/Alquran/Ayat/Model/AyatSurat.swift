//
//  AyatSurat.swift
//
//  Created by Aprizal on 22/5/20
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public struct AyatSurat: Decodable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let nomor = "nomor"
    static let asma = "asma"
    static let ayat = "ayat"
    static let arti = "arti"
    static let rukuk = "rukuk"
    static let keterangan = "keterangan"
    static let name = "name"
    static let nama = "nama"
    static let start = "start"
    static let type = "type"
    static let urut = "urut"
  }

  // MARK: Properties
  public var nomor: String?
  public var asma: String?
  public var ayat: String?
  public var arti: String?
  public var rukuk: String?
  public var keterangan: String?
  public var name: String?
  public var nama: String?
  public var start: String?
  public var type: String?
  public var urut: String?

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
    nomor = json[SerializationKeys.nomor].string
    asma = json[SerializationKeys.asma].string
    ayat = json[SerializationKeys.ayat].string
    arti = json[SerializationKeys.arti].string
    rukuk = json[SerializationKeys.rukuk].string
    keterangan = json[SerializationKeys.keterangan].string
    name = json[SerializationKeys.name].string
    nama = json[SerializationKeys.nama].string
    start = json[SerializationKeys.start].string
    type = json[SerializationKeys.type].string
    urut = json[SerializationKeys.urut].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = nomor { dictionary[SerializationKeys.nomor] = value }
    if let value = asma { dictionary[SerializationKeys.asma] = value }
    if let value = ayat { dictionary[SerializationKeys.ayat] = value }
    if let value = arti { dictionary[SerializationKeys.arti] = value }
    if let value = rukuk { dictionary[SerializationKeys.rukuk] = value }
    if let value = keterangan { dictionary[SerializationKeys.keterangan] = value }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = nama { dictionary[SerializationKeys.nama] = value }
    if let value = start { dictionary[SerializationKeys.start] = value }
    if let value = type { dictionary[SerializationKeys.type] = value }
    if let value = urut { dictionary[SerializationKeys.urut] = value }
    return dictionary
  }

}
