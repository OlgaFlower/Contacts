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
    
    //MARK: - Load contacts from DB, sorted alphabetically by name
    func loadContactsFromDB() -> [Person]? {
        let request: NSFetchRequest<Person> = Person.fetchRequest()
        let sort = NSSortDescriptor(key: "firstName", ascending: true, selector: #selector(NSString.caseInsensitiveCompare(_:)))
        request.sortDescriptors = [sort]
        
        do {
            let sortedList = try context.fetch(request)
            return sortedList
        }
        catch {
            print("Error fetching/sorting data from DB \( error)")
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

