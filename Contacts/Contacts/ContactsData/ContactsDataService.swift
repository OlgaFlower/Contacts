//
//  ContactsDataService.swift
//  Contacts
//
//  Created by Olha Bereziuk on 05.06.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

import UIKit
import CoreData

class ContactsDataService {
    
    private init() {}
    static let shared = ContactsDataService()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //MARK: - Save items to DB
    func saveToDB() {
        do {
            try context.save()
        } catch {
            print("*** Error saving contacts to DB \(error)")
        }
    }
    
    //MARK: - Load items from DB
    func loadContactsFromDB() -> [Person]? {
        let request: NSFetchRequest<Person> = Person.fetchRequest()
        do {
            let itemsArr = try context.fetch(request)
            return itemsArr
        } catch {
            print("Error fetching data from DB \( error)")
        }
        return nil
    }
    
    //MARK: - Erase contacts base
    func eraseContactListFromDB(_ list: [Person]?) {
        guard let list = list else { return }
        
        for contact in 0 ..< list.count {
            context.delete(list[contact])
        }
        saveToDB()
    }
}

