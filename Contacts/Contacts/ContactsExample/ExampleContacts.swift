//
//  ExampleContacts.swift
//  Contacts
//
//  Created by Olha Bereziuk on 05.06.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

import UIKit

class ExampleContacts {
    
    private init() {}
    static let shared = ExampleContacts()
    
    func createExampleContacts() -> [Person] {
        let contact1 = Person()
        let contact2 = Person()
        let contact3 = Person()
        
        contact1.email = "evabraun@gmail.com"
        contact1.firstName = "Eva"
        contact1.lastName = "Brown"
        
        contact2.email = "viktoriaivanova@ukr.net"
        contact2.firstName = "Viktoria"
        contact2.lastName = "Ivanova"
        
        contact3.email = "iuliaskaletska@gmail.com"
        contact3.firstName = "Iulia"
        contact3.lastName = "Skaletska"
        
        return [contact1, contact2, contact3]
    }
    
}

