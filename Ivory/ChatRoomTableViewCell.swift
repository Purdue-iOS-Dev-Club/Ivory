//
//  ChatRoomTableViewCell.swift
//  Ivory
//
//  Created by Nikhil Nandkumar on 2/16/16.
//  Copyright © 2016 Purdue iOS Dev Club. All rights reserved.
//

import UIKit

class ChatRoomTableViewCell: UITableViewCell {

    @IBOutlet weak var groupNameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var groupImage: UIImageView!
    internal let blueDotLayer = CALayer()
    var shouldDisplayBlueDot: Bool = false {
        didSet {
            blueDotLayer.removeFromSuperlayer()
            if shouldDisplayBlueDot == true {
                self.layer.addSublayer(blueDotLayer)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let height = self.frame.height
        let circleDiameter = CGFloat(8)
        
        self.blueDotLayer.frame = CGRectMake(15, (height - circleDiameter) / 2, circleDiameter, circleDiameter)
        self.blueDotLayer.cornerRadius = circleDiameter / 2.0
        self.blueDotLayer.backgroundColor = UIColor(red: 0, green: 0.5, blue: 1, alpha: 1).CGColor
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
