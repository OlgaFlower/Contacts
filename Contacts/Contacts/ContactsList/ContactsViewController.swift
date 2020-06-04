//
//  ContactsViewController.swift
//  Contacts
//
//  Created by Olha Bereziuk on 04.06.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var contentSearchView: UIView!
    
    //MARK: - Properties
    private let presenter = ContactsPresenter()
//    private var contactsList: [Person]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ContactTableViewCell", bundle: nil), forCellReuseIdentifier: "contactCell")
    }
    
}

extension ContactsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! ContactTableViewCell
        presenter.configureContactCell(cell, indexPath: indexPath)
        return cell
    }
    
    
    
    
}
