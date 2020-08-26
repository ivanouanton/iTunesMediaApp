//
//  itunesObj.swift
//  mediaApp
//
//  Created by Anton Ivanov on 8/5/20.
//  Copyright © 2020 Anton Ivanov. All rights reserved.
//

import Foundation
import RealmSwift

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
    let trackId: Int
    let imgUrl: String?
    let trackName: String?
    let kind: String?
    var isSaved: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case trackId = "trackId"
        case imgUrl = "artworkUrl30"
        case trackName = "trackName"
        case kind = "kind"
    }
}

public class StoreMediaObj: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var imgUrl: String?
    @objc dynamic var trackName: String?
    @objc dynamic var kind: String?
    
    public override static func primaryKey() -> String? {
        return "id"
    }
}
