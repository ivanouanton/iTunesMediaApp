//
//  String+Whitespasces.swift
//  mediaApp
//
//  Created by Антон Иванов on 8/16/20.
//  Copyright © 2020 Anton Ivanov. All rights reserved.
//

extension String {
    func condenseWhitespace(with symbol: String = " ") -> String {
        let components = self.components(separatedBy: .whitespacesAndNewlines)
        return components.filter { !$0.isEmpty }.joined(separator: symbol)
    }
}
