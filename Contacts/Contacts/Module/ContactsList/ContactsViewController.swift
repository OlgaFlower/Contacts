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
    private var contactList: [Person]?
    let dataBase = ContactsDataService.shared
    var condition: [DefaultCondition]? //flag for displaying default starting contacts
    let example = ExampleContacts.shared

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        displayContacts()
    }
    
    //MARK: - Setup UI
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
    
    //Reset to defaults
    @objc func resetTapped() {
        
    }
    
    //Add new contact
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

extension ContactsViewController {
    
    func displayContacts() {
        condition = dataBase.loadConditionFromDB()
        if condition?.first?.flag == nil {
            createDefaultContactList()
            //Load examples
            loadContacts()
            changeFlagCondition()
        } else {
            //Load contacts
            loadContacts()
        }
    }
    
    
    //Load contacts
    func loadContacts() {
        contactList = dataBase.loadContactsFromDB()
    }
    
    //Create example list
    func createDefaultContactList() {
        saveDefaultContactCards(example.contact1)
        saveDefaultContactCards(example.contact2)
        saveDefaultContactCards(example.contact3)
    }
    
    //Create examples
    func saveDefaultContactCards(_ contactDetails: DefaultContacts) {
        let person = Person(context: dataBase.context)
        person.email = contactDetails.email
        person.firstName = contactDetails.firstName
        person.lastName = contactDetails.lastName
        dataBase.saveToDB()
    }
    
    //Change flag condition
    func changeFlagCondition() {
        let updatedFlag = DefaultCondition(context: dataBase.context)
        updatedFlag.flag = true
        dataBase.saveToDB()
    }
}
