//
//  ContactVC + Search.swift
//  Contacts
//
//  Created by Olha Bereziuk on 07.06.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

import UIKit

//MARK: - ContactsVC + UISearch Controller
extension ContactsViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)
    }
    
    func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search name"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    func filterContentForSearchText(_ text: String) {
        filteredContactList = contactList?.filter { (contact: Person) -> Bool in
            guard let contact = contact.firstName?.lowercased().contains(text.lowercased()) else { return false }
            return contact
        }
        tableView.reloadData()
    }
}
