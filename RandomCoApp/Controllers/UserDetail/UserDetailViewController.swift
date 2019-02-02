//
//  UserDetailViewController.swift
//  RandomCoApp
//
//  Created by Francisco Lucena de Juan on 02/02/2019.
//  Copyright © 2019 Francisco Lucena de Juan. All rights reserved.
//

import UIKit
import SDWebImage

class UserDetailViewController: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var registrationLabel: UILabel!
    
    var currentUser: User?

    override func viewDidLoad() {
        super.viewDidLoad()
        showUserDetail()
    }
    
    func showUserDetail() {
        guard let user = currentUser else {
            print("ERROR IN CURRENT USER")
            return
        }
        self.nameLabel.text = user.firstName + " " + user.lastName
        self.emailLabel.text = user.email
        self.phoneLabel.text = user.phone
        self.profileImageView.sd_setImage(with: URL(string: user.largeImage), placeholderImage: UIImage(named: "img_no_photo"))
        self.genderLabel.text = user.gender
        self.locationLabel.text = user.street + " - " + user.city + " - " + user.state
        
        let dateFormated = Date.getFormattedDate(string: user.registrationDate, formatter: " MMM dd yyyy")
        self.registrationLabel.text = dateFormated
        
    }
}
