//
//  itunesObj.swift
//  mediaApp
//
//  Created by Anton Ivanov on 8/5/20.
//  Copyright © 2020 Anton Ivanov. All rights reserved.
//

import Foundation

// MARK: - ITunesObj
struct ITunesObj: Codable {
    let resultCount: Int
    let results: [Media]
    
    enum CodingKeys: String, CodingKey {
        case resultCount = "resultCount"
        case results = "results"
    }
}

// MARK: - Media
struct Media: Codable {
    let trackName: String
    let kind: String
    
    enum CodingKeys: String, CodingKey {
        case trackName = "trackName"
        case kind = "kind"
    }
}
