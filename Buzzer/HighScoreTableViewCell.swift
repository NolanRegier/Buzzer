//
//  HighScoreTableViewCell.swift
//  Buzzer
//
//  Created by Nolan Regier on 2016-06-13.
//  Copyright © 2016 Nolan Regier. All rights reserved.
//

import UIKit

class HighScoreTableViewCell: UITableViewCell {
    
    @IBOutlet weak var playerScoreLabel: UILabel!
    @IBOutlet weak var playerNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
