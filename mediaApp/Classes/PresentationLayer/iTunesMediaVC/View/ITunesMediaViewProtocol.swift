//
//  ITunesMediaViewProtocol.swift
//  mediaApp
//
//  Created by Anton Ivanov on 8/13/20.
//  Copyright © 2020 Anton Ivanov. All rights reserved.
//

protocol ITunesMediaViewProtocol: class {
    func showModalError(with message: String)
    func updateList(with data: [Media])
}
