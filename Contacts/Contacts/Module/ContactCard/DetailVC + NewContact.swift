//
//  DetailVC + NewContact.swift
//  Contacts
//
//  Created by Olha Bereziuk on 06.06.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

import Foundation

extension DetailViewController {
    
    func checkForEmptyFields() -> Bool  {
        let empty = ""
        if firstNameTextfield.text == empty && lastNameTextfield.text == empty && emailTextfield.text == empty {
            return true
        }
        return false
    }
    
    func addNewContact() {
        let contact = Person(context: dataBase.context)
        
        contact.firstName = firstNameTextfield.text
        contact.lastName = lastNameTextfield.text
        contact.email = emailTextfield.text
        
        dataBase.saveToDB()
    }
    
}
