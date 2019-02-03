//
//  FavouriteUsersViewController.swift
//  RandomCoApp
//
//  Created by Francisco Lucena de Juan on 03/02/2019.
//  Copyright © 2019 Francisco Lucena de Juan. All rights reserved.
//

import UIKit

class FavouriteUsersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    @IBOutlet weak var favouriteUsersTableView: UITableView!
    
    let cellIdentifier = "CellForUsers"
    var selectedUser: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.favouriteUsersTableView.register(UINib(nibName: "UsersTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowFavouriteUserDetail" {
            guard let vController: UserDetailViewController = segue.destination as? UserDetailViewController else {
                print("ERROR VIEWCONTROLLER IN PREPARE SEGUE")
                return
            }
            vController.currentUser = self.selectedUser
        }
    }

    // MARK: - TableView DataSource and Delegates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DBManager.sharedInstance.getFavouriteUsers().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: UsersTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? UsersTableViewCell else {
            print("ERROR - Cell not initialized")
            return UITableViewCell()
        }
        
        cell.configureWith(user: DBManager.sharedInstance.getFavouriteUsers()[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedUser = DBManager.sharedInstance.getFavouriteUsers()[indexPath.row]
        self.performSegue(withIdentifier: "ShowFavouriteUserDetail", sender: indexPath.row)
    }
    

}
