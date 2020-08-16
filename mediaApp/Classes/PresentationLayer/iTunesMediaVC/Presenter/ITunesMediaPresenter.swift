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
    
    private var offset: Int = 0
    private var searchValue: String = ""

    required init(view: ITunesMediaViewProtocol) {
        self.view = view
    }
    
    func fetchData(with value: String) {

        let searchVal = value.condenseWhitespace(with: "+")

        offset = 0
        iTunesService.getITunesMedia(with: searchVal, success: { (code, objects) in
            self.searchValue = value
            self.view?.updateList(with: objects.results)
        }) { (code) in
            self.searchValue = ""
        }
    }
    
    func loadMore() {
        
        offset += iTunesService.limit
        iTunesService.getITunesMedia(with: searchValue, offset: offset, success: { (code, objects) in
            self.view?.updateMore(with: objects.results)
        }) { (code) in
            self.offset -= self.iTunesService.limit
        }
    }
    
}
