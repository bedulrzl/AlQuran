//
//  APIClient.swift
//  corona
//
//  Created by Aprizal on 25/4/20.
//  Copyright © 2020 Aprizal. All rights reserved.
//

import SwiftyJSON
import Alamofire

class  APIClient {
    
    func request<T: APIConfiguration>(endpoint: T, completion: @escaping (Swift.Result<JSON, Error>) -> Void) {
        AF.request(endpoint).responseJSON(completionHandler: { response in
            DispatchQueue.main.async {
                    guard let data = response.data else {
                        completion(.failure(response.error!))
                        return
                    }
                    let json = JSON(data)
                    
                   print(json)
                    
                    completion(.success(JSON(data)))
                }
            })
        }
    }
