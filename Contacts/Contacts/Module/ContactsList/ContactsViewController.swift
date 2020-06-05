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
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var addNewContactButton: UIButton!
    
    //MARK: - Properties
    private let presenter = ContactsPresenter()
    
    private var contactsList: [Person]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupVC()
        
    }
    
    func setupVC() {
        setupTableView()
        setupSearchBar()
        setupResetNavBarButton()
        setupNavbarAppearence()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "ContactTableViewCell", bundle: nil), forCellReuseIdentifier: "contactCell")
        tableView.backgroundColor = .clear
    }
    
    func setupSearchBar() {
        searchBar.backgroundImage = UIImage()
        searchBar.searchTextField.leftView?.tintColor = .white
    }
    
    func setupResetNavBarButton() {
        let restoreImage = UIImage(named: "restore")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: restoreImage, style: .done, target: self, action: #selector(resetTapped))
    }
    
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
    
    //MARK: - Actions
    @objc func resetTapped() {
        
    }
    
    @IBAction func addNewContactTapped(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.modalPresentationStyle = .fullScreen
        vc.isNewContact = true
        self.present(vc, animated: true, completion: nil)
    }
    
}

//MARK: - Table View Datasource
extension ContactsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! ContactTableViewCell
        cell.layer.backgroundColor = UIColor.clear.cgColor
        
        presenter.configureContactCell(cell, indexPath: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
         self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}


extension ContactsViewController {
    
    func restoreStartingExamples() {
        
    }
    
    func saveStartingExaples() {
        let example = ExampleContacts.shared.createExampleContacts()
        
    }
    
}
