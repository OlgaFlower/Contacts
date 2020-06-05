//
//  ContactsPresenter.swift
//  Contacts
//
//  Created by Olha Bereziuk on 04.06.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//


protocol ContactsPresenterProtocol: class {
//    func configureContactCell(_ cell: ContactTableViewCellProtocol, indexPath: IndexPath, _ contacts: [Person])
    
    func configureContactCell(_ cell: ContactTableViewCellProtocol, indexPath: IndexPath)
}

import Foundation

class ContactsPresenter: ContactsPresenterProtocol {
    func configureContactCell(_ cell: ContactTableViewCellProtocol, indexPath: IndexPath) {
        cell.displayFullName(firstName: "Eva", lastName: "Bereziuk")
        cell.displayEmail(email: "kindzyadzyu@gmail.com")
    }
    
    
    //    func configureContactCell(_ cell: ContactTableViewCellProtocol, indexPath: IndexPath, _ contacts: [Person]) {
    //        cell.displayFullName(firstName: contacts[indexPath.row].firstName, lastName: contacts[indexPath.row].lastName)
//        cell.displayEmail(email: contacts[indexPath.row].email)
//    }
    
}
