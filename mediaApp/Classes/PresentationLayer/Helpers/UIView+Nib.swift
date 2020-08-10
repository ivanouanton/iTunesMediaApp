//
//  UIView+Nib.swift
//  mediaApp
//
//  Created by Anton Ivanov on 8/10/20.
//  Copyright © 2020 Anton Ivanov. All rights reserved.
//

import UIKit

extension UIView {
    
    @discardableResult
    func fromNib<T : UIView>() -> T? {
        guard let contentView = Bundle(for: type(of: self)).loadNibNamed(type(of: self).className, owner: self, options: nil)?.first as? T else {
            return nil
        }
        addSubview(contentView)
        contentView.fillSuperview()
        return contentView
    }
}
