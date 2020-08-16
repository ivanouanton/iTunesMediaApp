//
//  NetworkClient.swift
//  mediaApp
//
//  Created by Anton Ivanov on 8/10/20.
//  Copyright © 2020 Anton Ivanov. All rights reserved.
//

import Foundation
import Alamofire

class NetworkClient {
    
    var baseURL: String?
    
    required init(baseUrl: String){
        self.baseURL = baseUrl
    }
    
    func getArray<T>(urlString: String,
                     success: @escaping (Int, T) -> (),
                     failure: @escaping (Int) -> ()) where T: Codable {
        
        let headers: HTTPHeaders = [
            "Accept": "application/json",
            "Content-Type": "application/json"
        ]
                
        let request = Alamofire
            .request("\(self.baseURL ?? "")\(urlString)",
                     method: .get,
                     encoding: JSONEncoding.default,
                     headers: headers)
        
        print(request.request as Any)
        
        request.responseJSON { response in
            
            guard let serverResponse = response.response else {
                failure(400)
                return
            }
            
            switch serverResponse.statusCode {
            case 200, 201:
                let decoder = JSONDecoder()
                do {
                    let itunesObjects = try decoder.decode(ITunesObj.self, from: response.data!)
                    success(serverResponse.statusCode, itunesObjects as! T)
                } catch let error {
                    print(error.localizedDescription)
                    failure(0)
                }
                
            default:
                failure(serverResponse.statusCode)
            }
        }
    }
}
