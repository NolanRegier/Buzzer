//
//  Image.swift
//  Buzzer
//
//  Created by Nolan Regier on 2016-05-09.
//  Copyright © 2016 Nolan Regier. All rights reserved.
//

import UIKit

@IBDesignable
class Image: UIImageView {

    override func awakeFromNib() {
        layer.cornerRadius = frame.size.width / 2
        clipsToBounds = true
        layer.borderColor = UIColor.blueColor().CGColor
        layer.borderWidth = 1.0
        
    }

}
