//
//  ITunesRequestConfigurator.swift
//  mediaApp
//
//  Created by Anton Ivanov on 8/10/20.
//  Copyright © 2020 Anton Ivanov. All rights reserved.
//

import Foundation

struct ITunesRequestConfigurator {
    
    static func configureURLString(_ baseURL: String, _ parameter: String, _ value: String) -> String {
        return baseURL + "?" + parameter + "=" + value
    }
    
    static func configureURLString(_ baseURL: String, parameters: [String:String]) -> String {
        var urlString = baseURL + "?"
        for (key,value) in parameters {
            urlString += "&" + key + "=" + value
        }
        
        return urlString
    }
}
