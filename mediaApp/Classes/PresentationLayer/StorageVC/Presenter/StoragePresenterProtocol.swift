//
//  StoragePresenterProtocol.swift
//  mediaApp
//
//  Created by Anton Ivanov on 8/24/20.
//  Copyright © 2020 Anton Ivanov. All rights reserved.
//

protocol StoragePresenterProtocol{
    init(view: StorageViewProtocol)
    func fetchSavedData()
}
