//
//  UsersTableViewCell.swift
//  RandomCoApp
//
//  Created by Francisco Lucena de Juan on 02/02/2019.
//  Copyright © 2019 Francisco Lucena de Juan. All rights reserved.
//

import UIKit
import SDWebImage

protocol UsersTableViewCellDelegate: class {
    func didPressFavouriteButton(sender: UIButton, indexPath: Int)
}

class UsersTableViewCell: UITableViewCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet weak var userPhoneLabel: UILabel!
    @IBOutlet weak var favouriteButton: UIButton!
    
    var cellDelegate: UsersTableViewCellDelegate?
    
    func configureWith(user: User) {
        self.profileImageView.layer.cornerRadius = self.profileImageView.frame.size.width / 2
        self.profileImageView.clipsToBounds = true
        self.profileImageView.sd_setImage(with: URL(string: user.thumbnail), placeholderImage: UIImage(named: "img_no_photo"))
        self.userNameLabel.text = user.firstName + " " + user.lastName
        self.userEmailLabel.text = user.email
        self.userPhoneLabel.text = user.phone
        
        self.favouriteButton.isSelected = user.isFavorite
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func favouriteButtonPressed(_ sender: UIButton) {
        cellDelegate?.didPressFavouriteButton(sender: sender, indexPath: sender.tag)
    }
}
