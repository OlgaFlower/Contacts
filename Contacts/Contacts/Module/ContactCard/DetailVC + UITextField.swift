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
    
    func displayTextfieldBorders() {
        if isNewContact {
            showTextfieldBorders()
        } else {
            hideTextfieldBorders()
        }
    }
    
    func hideTextfieldBorders() {
        firstNameTextfield.borderStyle = .none
        lastNameTextfield.borderStyle = .none
        emailTextfield.borderStyle = .none
    }
    
    func showTextfieldBorders() {
        firstNameTextfield.borderStyle = .roundedRect
        lastNameTextfield.borderStyle = .roundedRect
        emailTextfield.borderStyle = .roundedRect
    }
    
    func disableDetailTextfieldAutocorrection() {
        disableAutocorrection(firstNameTextfield)
        disableAutocorrection(lastNameTextfield)
        disableAutocorrection(emailTextfield)
    }
    
    func disableAutocorrection(_ textfield: UITextField) {
        textfield.autocorrectionType = .no
    }

    //Switch editable mode for text fields
    func editContactCard() {
        if !isNewContact || !isEditableMode {
            disableTextfieldEditing(firstNameTextfield)
            disableTextfieldEditing(lastNameTextfield)
            disableTextfieldEditing(emailTextfield)
        }
        if isNewContact || isEditableMode {
            enableTextfieldEditing(firstNameTextfield)
            enableTextfieldEditing(lastNameTextfield)
            enableTextfieldEditing(emailTextfield)
        }
    }
    
    //Disable text field editing
    func disableTextfieldEditing(_ textfield: UITextField) {
        textfield.isEnabled = false
    }
    
    //Enable text field editing
    func enableTextfieldEditing(_ textfield: UITextField) {
        textfield.isEnabled = true
    }
    
    //Hide empty field warning
    func textFieldDidBeginEditing(_ textField: UITextField) {
        warningLabel.text = ""
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




