//
//  UsersTableViewController+UITableView.swift
//  RandomCoApp
//
//  Created by Francisco Lucena de Juan on 02/02/2019.
//  Copyright © 2019 Francisco Lucena de Juan. All rights reserved.
//

import Foundation
import UIKit

extension UsersTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - TableViewDataSource and Delegates
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DBManager.sharedInstance.getData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell: UsersTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? UsersTableViewCell else {
            print("ERROR - Cell not initialized")
            return UITableViewCell()
        }
        
        cell.configureWith(user: DBManager.sharedInstance.getData()[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedUser = DBManager.sharedInstance.getData()[indexPath.row]
        self.performSegue(withIdentifier: "ShowUserDetail", sender: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastElement = DBManager.sharedInstance.getData().count - 1
        if indexPath.row == lastElement {
            DispatchQueue.main.async {
                self.actualPage += 1
                self.callForUsers(self.actualPage)
            }
        }
    }
    
    
}
