//
//  ContactsVC + UITableView.swift
//  Contacts
//
//  Created by Olha Bereziuk on 05.06.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

import UIKit

//MARK:  Contact View Controller + Table View Datasource

extension ContactsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredContactList?.count ?? 0
        }
        return contactList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! ContactTableViewCell
        cell.layer.backgroundColor = UIColor.clear.cgColor
        let list: [Person]?
        
        if isFiltering {
            list = filteredContactList
        }
        else {
            list = contactList
        }
        
        guard let contacts = list else { return UITableViewCell() }
        presenter.configureContactCell(cell, contacts[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        guard let selectedContact = contactList?[indexPath.row] else { return }
        vc.personCard = selectedContact
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: Delete contact from list
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { _, _, complete in
            guard let contact = self.contactList?[indexPath.row] else { return }
            self.dataBase.context.delete(contact)
            self.dataBase.saveToDB()
            self.contactList?.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            self.tableView.reloadData()
            complete(true)
        }
        
        deleteAction.image = UIImage(named: "remove2")
        deleteAction.backgroundColor = #colorLiteral(red: 0.05524021184, green: 0.1857604743, blue: 1, alpha: 1)
        
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        configuration.performsFirstActionWithFullSwipe = true
        return configuration
    }
}

