//
//  ExampleContacts.swift
//  Contacts
//
//  Created by Olha Bereziuk on 05.06.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

struct DefaultContacts {
    var email: String?
    var firstName: String?
    var lastName: String?
}


import UIKit

class ExampleContacts {
    
    private init() {}
    static let shared = ExampleContacts()
    
    let contact1 = DefaultContacts(email: "evaboiko@gmail.com", firstName: "Eva", lastName: "Boiko")
    let contact2 = DefaultContacts(email: "viktoriaivanova@ukr.net", firstName: "Viktoria", lastName: "Ivanova")
    let contact3 = DefaultContacts(email: "iuliaskaletska@gmail.com", firstName: "Iulia", lastName: "Skaletska")
    
//    var contact1: Person?
//    var contact2: Person?
//    var contact3: Person?
//
//    func createExampleContacts() -> [Person?] {
//
//        contact1?.email = "evabraun@gmail.com"
//        contact1?.firstName = "Eva"
//        contact1?.lastName = "Brown"
//
//        contact2?.email = "viktoriaivanova@ukr.net"
//        contact2?.firstName = "Viktoria"
//        contact2?.lastName = "Ivanova"
//
//        contact3?.email = "iuliaskaletska@gmail.com"
//        contact3?.firstName = "Iulia"
//        contact3?.lastName = "Skaletska"
//
//        return [contact1, contact2, contact3]
//
//    }
    
}

