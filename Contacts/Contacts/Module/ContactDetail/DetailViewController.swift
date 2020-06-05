//
//  DetailViewController.swift
//  Contacts
//
//  Created by Olha Bereziuk on 05.06.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var addNewContactButton: UIButton!
    
    //MARK: - Properties
    var isNewContact = false
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        hideAddContactButton()
    }
    
    //MARK: - Methods
    func hideAddContactButton() {
        print("isNewContact = \(isNewContact)")
        addNewContactButton.isHidden = !isNewContact
    }
    
    //MARK: - Actions
    @IBAction func doneButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
