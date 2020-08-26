//
//  ITunesMediaPresenter.swift
//  mediaApp
//
//  Created by Anton Ivanov on 8/13/20.
//  Copyright © 2020 Anton Ivanov. All rights reserved.
//

import Foundation

class ITunesMediaPresenter: ITunesMediaPresenterProtocol{

    weak var view: ITunesMediaViewProtocol?
    
    private let iTunesService = ServiceRegistry.iTunesService
    private let realmStorageService: DBClentProtocol?
    
    private var objects: [Media] = []
    
    private var offset: Int = 0
    private var searchValue: String = ""

    required init(view: ITunesMediaViewProtocol) {
        self.view = view
        realmStorageService = RealmDBClient()
    }
    
    func fetchData(with value: String) {

        let searchVal = value.condenseWhitespace(with: "+")

        offset = 0
        iTunesService.getITunesMedia(with: searchVal, success: { (code, objects) in
            self.searchValue = value
            self.objects = objects.results
            self.view?.updateList(with: objects.results)
        }) { (code) in
            self.searchValue = ""
        }
    }
    
    func loadMore() {
        
        offset += iTunesService.limit
        iTunesService.getITunesMedia(with: searchValue, offset: offset, success: { (code, objects) in
            self.objects.append(contentsOf: objects.results)
            self.view?.updateList(with: self.objects)
        }) { (code) in
            self.offset -= self.iTunesService.limit
        }
    }
    
    func save(with value: Media) {
        realmStorageService?.saveObject(with: value)
        
        for index in 0..<objects.count {
            if (objects[index].trackName == value.trackName) {
                objects[index].isSaved = true
            }
        }
        
        view?.updateList(with: self.objects)
    }
    
}
