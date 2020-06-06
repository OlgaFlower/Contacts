//
//  Detail + UITextField.swift
//  Contacts
//
//  Created by Olha Bereziuk on 06.06.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

import UIKit

extension DetailViewController: UITextFieldDelegate {
    
    
    func setupTextfields() {
        firstNameTextfield.delegate = self
        lastNameTextfield.delegate = self
        emailTextfield.delegate = self
        
        disableDetailTextfieldAutocorrection()
    }
    
    func disableDetailTextfieldAutocorrection() {
        disableAutocorrection(firstNameTextfield)
        disableAutocorrection(lastNameTextfield)
        disableAutocorrection(emailTextfield)
    }
    
    func disableAutocorrection(_ textfield: UITextField) {
        textfield.autocorrectionType = .no
    }
    
    //MARK: - Handle keyboard
    //show keyboard and scroll view up
    func showKeyboard(_ notification: NSNotification) {
        guard let userInfo = notification.userInfo else {return}
        guard let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {return}
        
        let keyboardFrame = keyboardSize.cgRectValue
        if self.view.frame.origin.y == 0 {
            self.view.frame.origin.y -= (keyboardFrame.height - 160)
        }
    }
    
    // hide keyboard and scroll view down
    func hideKeyboard(_ notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    //hide keyboard by click on "return" button
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}



