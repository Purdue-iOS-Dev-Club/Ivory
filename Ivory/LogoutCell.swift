//
//  LogoutCell.swift
//  Ivory
//
//  Created by Siraj Zaneer on 3/3/16.
//  Copyright © 2016 Purdue iOS Dev Club. All rights reserved.
//

import UIKit

class LogoutCell: UITableViewCell {

    @IBOutlet weak var logoutButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        logoutButton.layer.cornerRadius = 5
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
