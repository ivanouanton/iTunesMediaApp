//
//  AutoIndentifierCell.swift
//  mediaApp
//
//  Created by Anton Ivanov on 8/6/20.
//  Copyright © 2020 Anton Ivanov. All rights reserved.
//

import UIKit

protocol AutoIndentifierCell: class {
    
    static var identifier: String { get }
    static var nibName: String { get }
}

//MARK: - UITableViewCell

extension AutoIndentifierCell where Self: UITableViewCell {
    
    static var identifier: String {
        return self.nibName
    }
    
    static var nibName: String {
        return String(describing: self)
    }
}

//MARK: - UICollectionViewCell

extension AutoIndentifierCell where Self: UICollectionViewCell {
    
    static var identifier: String {
        return self.nibName
    }
    
    static var nibName: String {
        return String(describing: self)
    }
}

//MARK: - UITableViewHeaderFooterView

extension AutoIndentifierCell where Self: UITableViewHeaderFooterView {
    
    static var identifier: String {
        return self.nibName
    }
    
    static var nibName: String {
        return String(describing: self)
    }
}


