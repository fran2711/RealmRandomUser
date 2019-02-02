//
//  ViewController.swift
//  RandomCoApp
//
//  Created by Francisco Lucena de Juan on 02/02/2019.
//  Copyright © 2019 Francisco Lucena de Juan. All rights reserved.
//

import UIKit
import Alamofire
import RealmSwift

class UsersTableViewController: UIViewController {
    
    @IBOutlet weak var usersTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var actualPage: Int = 0
    let cellIdentifier = "CellForUsers"    
    var selectedUser: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        callForUsers(actualPage)
    }
    
    func callForUsers(_ actualPage: Int) {
        if activityIndicator.isAnimating == false {
            activityIndicator.startAnimating()
        }
        let url = Constants.baseUrl + Constants.pageCount + String(actualPage) + Constants.resultsNumber
        
        Alamofire.request(url).responseJSON { response in
            switch response.result {
            case .success(_):
                guard let responseJSON = response.result.value as? [String: AnyObject],
                    let usersArray = responseJSON["results"] as? [[String: AnyObject]]  else {
                        print("Error while fetching users: \(String(describing: response.result.error))")
                        return
                }
                for user in usersArray {
                    if let user = User(JSON: user) {
                        DBManager.sharedInstance.addData(user: user)
                        DispatchQueue.main.async {
                            self.usersTableView.reloadData()
                        }
                    }
                }
            case .failure(let error):
                print("ERROR ----\n\(error)")
            }
            self.activityIndicator.stopAnimating()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowUserDetail" {
            guard let vController: UserDetailViewController = segue.destination as? UserDetailViewController else {
                print("ERROR VIEWCONTROLLER IN PREPARE SEGUE")
                 return
            }
            vController.currentUser = self.selectedUser
        }
    }
    
    
}
