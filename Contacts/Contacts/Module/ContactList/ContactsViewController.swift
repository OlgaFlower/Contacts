//
//  ContactsViewController.swift
//  Contacts
//
//  Created by Olha Bereziuk on 04.06.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//



import UIKit

class ContactsViewController: UIViewController{
    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var addNewContactButton: UIButton!
    
    //MARK: - Properties
    let presenter = ContactsPresenter()
    var contactList: [Person]?
    let dataBase = ContactsDataService.shared
    var condition: [DefaultCondition]? //flag for displaying default starting contacts
    let example = ExampleContacts.shared

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateContactList(notification:)), name: Notification.Name("ContactLisUpdater"), object: nil)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        displayContacts()
    }
    
    
    
    //MARK: - Actions
    
    //Contact list updater
    @objc func updateContactList(notification: Notification) {
        tableView.reloadData()
    }
    
    //Reset to default contacts' list 
    @objc func resetTapped() {
        dataBase.eraseContactListFromDB()
        createDefaultContactList()
        loadContacts()
        tableView.reloadData()
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
