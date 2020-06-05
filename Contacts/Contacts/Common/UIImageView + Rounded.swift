//
//  UIImageView + Rounded.swift
//  Contacts
//
//  Created by Olha Bereziuk on 05.06.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

import UIKit

//Round image
extension UIImageView {
    func rounded() {
        self.layer.cornerRadius = self.layer.frame.height / 3
    }
}
