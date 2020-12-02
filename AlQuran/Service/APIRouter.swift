//
//  APIRouter.swift
//  corona
//
//  Created by Aprizal on 25/4/20.
//  Copyright © 2020 Aprizal. All rights reserved.
//

import Foundation
import Alamofire


enum APIRouter: APIConfiguration {

    case kota
    case jadwalSolat(kodekot: String, tanggal: String)
    case surat
    case ayat(suratkode: String, nomorKode: String)
    
    //MARK: - METHOD
    var method: HTTPMethod {
        switch  self {
        case .kota, .jadwalSolat:
            return .get
        case .surat:
            return .get
        case .ayat:
            return .get
        }
    }
    
    //MARK: - path
     var path: String {
        switch self {
        case .kota:
            return "/sholat/format/json/kota"
        case .jadwalSolat(let kodekot, let tanggal):
            return "/sholat/format/json/jadwal/kota/\(kodekot)/tanggal/\(tanggal)"
        case .surat:
            return "/quran/format/json/surat"
        case .ayat(let suratkot, let nomorKode):
            return "quran/format/json/surat/\(suratkot)/ayat/\(nomorKode)"
        }
    }
    
    //MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .kota:
            return nil
        case .jadwalSolat:
            return nil
        case .surat:
            return nil
        case .ayat:
            return nil
        }
    }
    
    //MARK: - urlrequest
    func asURLRequest() throws -> URLRequest {
        let url = try K.ProductionServer.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        urlRequest.httpMethod = method.rawValue
        
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.accepType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
//        if let parameters = parameters {
//            do {
//                urlRequest.httpBody = try JSONSerialization.Data(withJSONObject: parameters, options: [])
//            } catch {
//                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
//            }
//        }
        
        return urlRequest
    }
}
