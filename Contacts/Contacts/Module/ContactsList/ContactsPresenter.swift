//
//  ContactsPresenter.swift
//  Contacts
//
//  Created by Olha Bereziuk on 04.06.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

protocol ContactsPresenterProtocol: class {
    func configureContactCell(_ cell: ContactTableViewCellProtocol, _ contacts: Person)
}

import Foundation

class ContactsPresenter: ContactsPresenterProtocol {
    
    func configureContactCell(_ cell: ContactTableViewCellProtocol, _ contacts: Person) {
        cell.displayEmail(email: contacts.email)
        cell.displayFullName(firstName: contacts.firstName, lastName: contacts.lastName)
    }
    
}
