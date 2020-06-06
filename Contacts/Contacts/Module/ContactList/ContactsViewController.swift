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
    var index: Int?

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
        print(condition?.first?.flag)
        //Observers
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateContactList(notification:)), name: .reloadContactList, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateContactCard(notification:)), name: .updatedContactCard, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        displayContacts()
    }
    
    //MARK: - Deinit
    deinit {
        NotificationCenter.default.removeObserver(self, name: .reloadContactList, object: nil)
        NotificationCenter.default.removeObserver(self, name: .updatedContactCard, object: nil)
    }
    
    
    //MARK: - Actions
    @objc func updateContactCard(notification: Notification) {
        guard let index = index else { return }
        print(index)

        guard let updatedContact = notification.object as? Person else {return}
        print("Contact list updated with \(updatedContact)")
    }

    //Contact list updater
    @objc func updateContactList(notification: Notification) {
        tableView.reloadData()
    }
    
    //Reset to default contacts' list 
    @objc func resetTapped() {
        dataBase.eraseContactListFromDB()
        contactList = nil
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
