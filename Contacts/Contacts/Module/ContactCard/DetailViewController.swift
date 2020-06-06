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
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var firstNameTextfield: UITextField!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var lastNameTextfield: UITextField!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var warningLabel: UILabel!
    
    //MARK: - Properties
    var isNewContact = false
    var isEditableMode = false
    var personCard: Person?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        displayDetails()
        
        setupTextfields()
        self.hideKeyboardIfTappedOutTextfield()
        editContactCard()
        
        //add observers for keyboard
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupUI()
    }
    
    //MARK: - Setup UI
    func setupUI() {
        setupAddContactButtons()
        setupNavbarEditButton()
        setupImage()
        setupLabels()
        setupButtons()
    }
    
    //MARK: Labels
    func setupLabels() {
        firstNameLabel.text = ContactCard.firstName.rawValue
        lastNameLabel.text = ContactCard.lastName.rawValue
        emailLabel.text = ContactCard.email.rawValue
    }
    
    //MARK: Buttons
    func setupButtons() {
        saveButton.setTitle(ContactCard.save.rawValue, for: .normal)
        cancelButton.setTitle(ContactCard.cancel.rawValue, for: .normal)
    }
    
    //Handle "add new contact" buttons visibility
    func setupAddContactButtons() {
        saveButton.isHidden = !isNewContact
        cancelButton.isHidden = !isNewContact
        if !saveButton.isHidden {
            roundButtons()
        }
    }
    
    //Add corner radius
    func roundButtons() {
        saveButton.rounded()
        cancelButton.rounded()
    }
    
    func displaySaveCancelButtons() {
        saveButton.isHidden = false
        cancelButton.isHidden = false
    }
    
    //MARK: Navigation bar
    //Add "edit" button to navigation bar
    func setupNavbarEditButton() {
        let editImage = UIImage(named: "edit")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: editImage, style: .done, target: self, action: #selector(editTapped))
    }
    
    //MARK: Contact image
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
    @objc func keyboardWillShow(notification: NSNotification) {
        showKeyboard(notification)
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        hideKeyboard(notification)
    }
    
    @objc func editTapped() {
        print("edit tapped")
        isEditableMode = !isEditableMode
        editContactCard()
        if isEditableMode {
            displaySaveCancelButtons()
            roundButtons()
        } else {
            setupAddContactButtons()
            
        }
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        print(emailTextfield.text)
        print(checkForEmptyFields())
        if checkForEmptyFields() {
            warningLabel.text = ContactCard.warning.rawValue
        }
        
//        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
