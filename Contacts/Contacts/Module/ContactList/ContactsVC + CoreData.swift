//
//  ContactsVC + CoreData.swift
//  Contacts
//
//  Created by Olha Bereziuk on 05.06.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

import UIKit

//MARK: Contacts View Controller + Core Data

extension ContactsViewController {
    
    func displayContacts() {
        createDefaultContactList()
        //Load examples
        loadContacts()
    }
    
    
    //Load contacts
    func loadContacts() {
        contactList = dataBase.loadContactsFromDB()
    }
    
    //Create example list
    func createDefaultContactList() {
        saveDefaultContactCards(example.contact1)
        saveDefaultContactCards(example.contact2)
        saveDefaultContactCards(example.contact3)
    }
    
    //Create examples
    func saveDefaultContactCards(_ contactDetails: DefaultContacts) {
        let person = Person(context: dataBase.context)
        person.email = contactDetails.email
        person.firstName = contactDetails.firstName
        person.lastName = contactDetails.lastName
        dataBase.saveToDB()
    }
}
