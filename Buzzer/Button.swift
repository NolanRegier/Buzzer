//
//  Button.swift
//  Buzzer
//
//  Created by Nolan Regier on 2016-05-09.
//  Copyright © 2016 Nolan Regier. All rights reserved.
//

import UIKit

class Button: UIButton{

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    override func awakeFromNib() {

        layer.cornerRadius = frame.size.height / 2
        clipsToBounds = true
        backgroundColor = UIColor(red: 0, green: 122, blue: 255, alpha: 1)
        setTitleColor(UIColor.whiteColor(), forState: .Normal)
        layer.borderWidth = 1.5
        layer.borderColor = UIColor.redColor().CGColor
        
    }
}
