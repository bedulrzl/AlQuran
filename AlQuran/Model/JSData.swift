//
//  JSData.swift
//
//  Created by Aprizal on 2/5/20
//  Copyright (c) Alquran. All rights reserved.
//

import Foundation
import SwiftyJSON

public final class JSData {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let imsak = "imsak"
    static let tanggal = "tanggal"
    static let ashar = "ashar"
    static let dzuhur = "dzuhur"
    static let dhuha = "dhuha"
    static let subuh = "subuh"
    static let isya = "isya"
    static let terbit = "terbit"
    static let maghrib = "maghrib"
  }

  // MARK: Properties
  public var imsak: String?
  public var tanggal: String?
  public var ashar: String?
  public var dzuhur: String?
  public var dhuha: String?
  public var subuh: String?
  public var isya: String?
  public var terbit: String?
  public var maghrib: String?

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
    imsak = json[SerializationKeys.imsak].string
    tanggal = json[SerializationKeys.tanggal].string
    ashar = json[SerializationKeys.ashar].string
    dzuhur = json[SerializationKeys.dzuhur].string
    dhuha = json[SerializationKeys.dhuha].string
    subuh = json[SerializationKeys.subuh].string
    isya = json[SerializationKeys.isya].string
    terbit = json[SerializationKeys.terbit].string
    maghrib = json[SerializationKeys.maghrib].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = imsak { dictionary[SerializationKeys.imsak] = value }
    if let value = tanggal { dictionary[SerializationKeys.tanggal] = value }
    if let value = ashar { dictionary[SerializationKeys.ashar] = value }
    if let value = dzuhur { dictionary[SerializationKeys.dzuhur] = value }
    if let value = dhuha { dictionary[SerializationKeys.dhuha] = value }
    if let value = subuh { dictionary[SerializationKeys.subuh] = value }
    if let value = isya { dictionary[SerializationKeys.isya] = value }
    if let value = terbit { dictionary[SerializationKeys.terbit] = value }
    if let value = maghrib { dictionary[SerializationKeys.maghrib] = value }
    return dictionary
  }

}
