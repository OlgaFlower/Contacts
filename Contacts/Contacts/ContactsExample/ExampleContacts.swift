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
    
    let contact1 = DefaultContacts(email: "eva_boiko@gmail.com", firstName: "Eva", lastName: "Boiko")
    let contact2 = DefaultContacts(email: "viktoria_ivanova@ukr.net", firstName: "Viktoria", lastName: "Ivanova")
    let contact3 = DefaultContacts(email: "iulia_skaletska@gmail.com", firstName: "Iulia", lastName: "Skaletska")
    
}

