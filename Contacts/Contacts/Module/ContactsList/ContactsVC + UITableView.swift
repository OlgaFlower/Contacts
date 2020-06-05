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
        return contactList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! ContactTableViewCell
        cell.layer.backgroundColor = UIColor.clear.cgColor
        guard let contacts = contactList else { return UITableViewCell() }
        presenter.configureContactCell(cell, contacts[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        guard let selectedContact = contactList?[indexPath.row] else { return }
        vc.personCard = selectedContact
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
