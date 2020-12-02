//
//  AQQuery.swift
//
//  Created by Aprizal on 16/5/20
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class AQQuery {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let surat = "surat"
    static let format = "format"
  }

  // MARK: Properties
  public var surat: String?
  public var format: String?

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
    surat = json[SerializationKeys.surat].string
    format = json[SerializationKeys.format].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = surat { dictionary[SerializationKeys.surat] = value }
    if let value = format { dictionary[SerializationKeys.format] = value }
    return dictionary
  }

}
