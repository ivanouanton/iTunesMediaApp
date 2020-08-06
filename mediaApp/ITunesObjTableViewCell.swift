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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
 
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension ITunesObjTableViewCell: AutoIndentifierCell {}
