//
//  APIConfiguration.swift
//  corona
//
//  Created by Aprizal on 25/4/20.
//  Copyright © 2020 Aprizal. All rights reserved.
//

import Foundation
import Alamofire

protocol APIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path : String { get }
}
