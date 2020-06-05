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
    @IBOutlet weak var contactImageView: UIImageView!
    @IBOutlet weak var addNewContactButton: UIButton!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var firstNameTextfield: UITextField!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var lastNameTextfield: UITextField!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextfield: UITextField!
    
    
    //MARK: - Properties
    var isNewContact = false
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavbarEditButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        hideAddContactButton()
    }
    
    
    //MARK: - Methods
    func hideAddContactButton() {
        print("isNewContact = \(isNewContact)")
        addNewContactButton.isHidden = !isNewContact
        if !addNewContactButton.isHidden {
            addNewContactButton.newContactButtonSetup()
        }
    }
    
    func setupNavbarEditButton() {
        let editImage = UIImage(named: "edit")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: editImage, style: .done, target: self, action: #selector(editTapped))
    }
    
    @objc func editTapped() {
        
    }
    
    //MARK: - Actions
    @IBAction func doneButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension UIButton {
func newContactButtonSetup() {
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 5.0
    self.layer.borderColor = UIColor.white.cgColor
    }
}
