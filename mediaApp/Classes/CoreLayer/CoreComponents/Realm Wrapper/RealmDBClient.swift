//
//  DBClient.swift
//  mediaApp
//
//  Created by Anton Ivanov on 8/22/20.
//  Copyright © 2020 Anton Ivanov. All rights reserved.
//

import RealmSwift

class RealmDBClient: DBClentProtocol {
    
    func saveObject(with data: Media) {
        
        let realm = try! Realm()
        let storedObjects = realm.objects(StoreMediaObj.self)
        
        let iTunesObj = StoreMediaObj()
        iTunesObj.kind = data.kind
        iTunesObj.trackName = data.trackName
        iTunesObj.id = "\(storedObjects.count)"
        
        try! realm.write({
            realm.add(iTunesObj)
        })
    }
    
    func getItunesObjs() -> [Media] {
        let objects = DataProvider().objects(StoreMediaObj.self)?.toArray(ofType: StoreMediaObj.self)
        return objects?.map { return Media(trackName: $0.trackName, kind: $0.kind) } ?? []
    }
    
}
