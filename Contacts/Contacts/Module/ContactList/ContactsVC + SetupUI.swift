//
//  ContactsVC + SetupUI.swift
//  Contacts
//
//  Created by Olha Bereziuk on 05.06.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

import UIKit

extension ContactsViewController {
    
    //MARK: Setup UI
    
    func setupVC() {
        setupTableView()
        setupSearchBar()
        setupResetNavBarButton()
        setupNavbarAppearence()
    }
    
    //Setup table view
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "ContactTableViewCell", bundle: nil), forCellReuseIdentifier: "contactCell")
        tableView.backgroundColor = .clear
    }
    
    //Setup search bar
    func setupSearchBar() {
        searchBar.backgroundImage = UIImage()
        searchBar.searchTextField.leftView?.tintColor = .white
    }
    
    //Setup "Reset" button
    func setupResetNavBarButton() {
        let restoreImage = UIImage(named: "restore")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: restoreImage, style: .done, target: self, action: #selector(resetTapped))
    }
    
    //Setup navigation bar
    func setupNavbarAppearence() {
        let navBar = navigationController?.navigationBar
        //items text color
        navBar?.tintColor = .white
        //title text color
        navBar?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont(name: "Chalkboard SE", size: 21)!]
        //transparency of the nav bar
        navBar?.setBackgroundImage(UIImage(), for: .default)
        navBar?.shadowImage = UIImage()
        navBar?.isTranslucent = true
    }
    
}
