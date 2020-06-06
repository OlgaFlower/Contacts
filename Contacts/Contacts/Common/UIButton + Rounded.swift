//
//  UIButton + Rounded.swift
//  Contacts
//
//  Created by Olha Bereziuk on 05.06.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

import UIKit

//Round button
extension UIButton {
func rounded() {
    self.layer.borderWidth = 0.5
    self.layer.cornerRadius = self.layer.frame.height / 2
    self.layer.borderColor = UIColor.white.cgColor
    }
}
