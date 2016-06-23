//
//  QuestionPickerCell.swift
//  Buzzer
//
//  Created by Nolan Regier on 2016-05-13.
//  Copyright © 2016 Nolan Regier. All rights reserved.
//

import UIKit

class QuestionPickerCell: UICollectionViewCell {
    @IBOutlet weak var priceLbl: UILabel!
    var answered = false {
        didSet {
            priceLbl.hidden = answered
        }
    }

}
