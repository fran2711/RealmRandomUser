//
//  UsersTableViewController+UITableView.swift
//  RandomCoApp
//
//  Created by Francisco Lucena de Juan on 02/02/2019.
//  Copyright © 2019 Francisco Lucena de Juan. All rights reserved.
//

import Foundation
import UIKit

extension UsersTableViewController: UITableViewDelegate, UITableViewDataSource, UsersTableViewCellDelegate {

    
    // MARK: - TableViewDataSource and Delegates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DBManager.sharedInstance.getUserData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell: UsersTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? UsersTableViewCell else {
            print("ERROR - Cell not initialized")
            return UITableViewCell()
        }
        
        cell.cellDelegate = self
        cell.configureWith(user: DBManager.sharedInstance.getUserData()[indexPath.row])
        cell.favouriteButton.tag = indexPath.row
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedUser = DBManager.sharedInstance.getUserData()[indexPath.row]
        self.performSegue(withIdentifier: "ShowUserDetail", sender: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        guard editingStyle == .delete else { return }
        
        let user = DBManager.sharedInstance.getUserData()[indexPath.row]
        
        DBManager.sharedInstance.deleteUserData(user: user)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    // MARK: - Cell Delegate Methods
    func didPressFavouriteButton(sender: UIButton, indexPath: Int) {
        let user = DBManager.sharedInstance.getUserData()[indexPath]
        DBManager.sharedInstance.makeUserFavourite(user: user, isFavourite: sender.isTouchInside)
        sender.isSelected = user.isFavorite
    }
    
}
