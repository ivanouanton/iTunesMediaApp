//
//  ITunesMediaPresenterProtocol.swift
//  mediaApp
//
//  Created by Anton Ivanov on 8/13/20.
//  Copyright © 2020 Anton Ivanov. All rights reserved.
//

protocol ITunesMediaPresenterProtocol{
    init(view: ITunesMediaViewProtocol)
    func fetchData(with value: String)
    func loadMore()
    func save(with value: Media)
    func checkForSaved()
}
