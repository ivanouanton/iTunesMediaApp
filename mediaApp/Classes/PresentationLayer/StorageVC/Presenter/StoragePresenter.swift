//
//  StoragePresenter.swift
//  mediaApp
//
//  Created by Anton Ivanov on 8/24/20.
//  Copyright © 2020 Anton Ivanov. All rights reserved.
//

class StoragePresenter: StoragePresenterProtocol{
    
    weak var view: StorageViewProtocol?
    
    private let realmStorageService: DBClentProtocol?
        
    required init(view: StorageViewProtocol) {
        self.view = view
        realmStorageService = RealmDBClient()
    }
    
    func fetchSavedData() {
        let objects = realmStorageService?.getItunesObjs() ?? []
        view?.updateList(with: objects)
    }
    
}
