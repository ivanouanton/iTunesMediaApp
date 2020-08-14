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

    required init(view: ITunesMediaViewProtocol) {
        self.view = view
    }
    
    func fetchData(with value: String) {
        iTunesService.getITunesMedia(with: value, success: { (code, objects) in
            self.view?.updateList(with: objects.results)
        }) { (code) in
            
        }
    }
    
}
