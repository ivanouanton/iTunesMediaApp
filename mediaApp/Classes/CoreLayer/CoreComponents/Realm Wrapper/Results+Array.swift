//
//  Results+Array.swift
//  mediaApp
//
//  Created by Anton Ivanov on 8/17/20.
//  Copyright © 2020 Anton Ivanov. All rights reserved.
//

import RealmSwift

extension Results {
    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for i in 0 ..< count {
            if let result = self[i] as? T {
                array.append(result)
            }
        }

        return array
    }
}
