//
//  DBClientProtocol.swift
//  mediaApp
//
//  Created by Anton Ivanov on 8/22/20.
//  Copyright © 2020 Anton Ivanov. All rights reserved.
//

import Foundation

protocol DBClentProtocol {
    func saveObject(with data: Media)
    func getItunesObjs() -> [Media]
}
