//
//  ContactTableViewCell.swift
//  Contacts
//
//  Created by Olha Bereziuk on 04.06.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

protocol ContactTableViewCellProtocol {
    func displayFullName(firstName: String?, lastName: String?)
    func displayEmail(email: String?)
}

import UIKit

class ContactTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var contactCellView: UIView!
    @IBOutlet weak var contactImageView: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        resetContent()
        setupViews()
    }

    //MARK: - Methods
    func resetContent() {
        fullNameLabel.text = nil
        emailLabel.text = nil
    }
    
    func setupViews() {
        contactCellView.layer.cornerRadius = 10
        contactImageView.layer.cornerRadius = contactImageView.frame.width / 4
    }
    
}

extension ContactTableViewCell: ContactTableViewCellProtocol {
    
    func displayFullName(firstName: String?, lastName: String?) {
        fullNameLabel.text = ("\(firstName ?? "") \(lastName ?? "")")
    }
    
    func displayEmail(email: String?) {
        emailLabel.text = ("\(email ?? "")")
    }
    
}
