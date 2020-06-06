//
//  UIViewController + Keyboard.swift
//  Contacts
//
//  Created by Olha Bereziuk on 06.06.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

import UIKit

extension UIViewController {
    //Hide keyboard when tapped out of the text field
    func hideKeyboardIfTappedOutTextfield() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
