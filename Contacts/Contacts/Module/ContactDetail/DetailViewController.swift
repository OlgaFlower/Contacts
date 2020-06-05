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
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var firstNameTextfield: UITextField!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var lastNameTextfield: UITextField!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextfield: UITextField!
    
    //MARK: - Properties
    var isNewContact = false
    var personCard: Person?
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        displayDetails()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupUI()
    }
    
    
    //MARK: - Setup UI
    func setupUI() {
        setupAddContactButtons()
        setupNavbarEditButton()
        setupImage()
    }
    
    //Handle "add new contact" buttons visibility
    func setupAddContactButtons() {
        addNewContactButton.isHidden = !isNewContact
        cancelButton.isHidden = !isNewContact
        if !addNewContactButton.isHidden {
            addNewContactButton.rounded()
            cancelButton.rounded()
        }
    }
    
    //Add "edit" button to navigation bar
    func setupNavbarEditButton() {
        let editImage = UIImage(named: "edit")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: editImage, style: .done, target: self, action: #selector(editTapped))
    }
    
    //Setup new contact image
    func setupImage() {
        contactImageView.rounded()
    }
    
    //MARK: - Display contact details
    func displayDetails() {
        firstNameTextfield.text = personCard?.firstName
        lastNameTextfield.text = personCard?.lastName
        emailTextfield.text = personCard?.email
    }
    
    //MARK: - Actions
    @objc func editTapped() {
        
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        print("contact saved")
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}


extension UIButton {
func rounded() {
    self.layer.borderWidth = 0.5
    self.layer.cornerRadius = self.layer.frame.height / 2
    self.layer.borderColor = UIColor.white.cgColor
    }
}

extension UIImageView {
    func rounded() {
        self.layer.cornerRadius = self.layer.frame.height / 3
    }
}
