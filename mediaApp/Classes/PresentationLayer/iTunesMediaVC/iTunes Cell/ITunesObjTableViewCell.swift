//
//  ITunesObjTableViewCell.swift
//  mediaApp
//
//  Created by Anton Ivanov on 8/6/20.
//  Copyright © 2020 Anton Ivanov. All rights reserved.
//

import UIKit

class ITunesObjTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!

    override func prepareForReuse() {
        super.prepareForReuse()
        self.backgroundColor = .clear
    }
}

extension ITunesObjTableViewCell: AutoIndentifierCell {}
