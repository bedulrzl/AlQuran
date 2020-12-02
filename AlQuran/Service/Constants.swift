//
//  Constants.swift
//  corona
//
//  Created by Aprizal on 25/4/20.
//  Copyright © 2020 Aprizal. All rights reserved.
//

import Foundation

struct K {
    struct ProductionServer {
        static let baseURL = "https://api.banghasan.com"
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case accepType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}
