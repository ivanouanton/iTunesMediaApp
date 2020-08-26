//
//  DBClient.swift
//  mediaApp
//
//  Created by Anton Ivanov on 8/22/20.
//  Copyright © 2020 Anton Ivanov. All rights reserved.
//

class RealmDBClient: DBClentProtocol {
    
    func saveObject(with data: Media) {
        
        let iTunesObj = StoreMediaObj()
        iTunesObj.kind = data.kind
        iTunesObj.trackName = data.trackName
        iTunesObj.id = "\(data.trackId)"
        
        DataProvider().add(iTunesObj)
    }
    
    func getItunesObjs() -> [Media] {
        let objects = DataProvider().objects(StoreMediaObj.self)?.toArray(ofType: StoreMediaObj.self)
        return objects?.map { return Media(trackId: Int($0.id)!, imgUrl: $0.imgUrl, trackName: $0.trackName, kind: $0.kind, isSaved: true) } ?? []
    }
    
    func removeItunesObj(with value: Media) {
        guard let obj = DataProvider().objects(StoreMediaObj.self)?.toArray(ofType: StoreMediaObj.self).filter ({ $0.id == String(value.trackId) }).first else { return }
        DataProvider().delete(obj)
    }
}
