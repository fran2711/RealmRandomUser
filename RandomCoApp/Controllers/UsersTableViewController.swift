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
    
    var actualPage: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        callForUsers(actualPage)
    }
    
    
    func callForUsers(_ actualPage: Int) {
        let url = Constants.baseUrl + Constants.pageCount + String(actualPage) + Constants.resultsNumber
        
        Alamofire.request(url).responseJSON { response in
            
            switch response.result {
            case .success(_):
                guard let responseJSON = response.result.value as? [String: AnyObject],
                    let usersArray = responseJSON["results"] as? [[String: AnyObject]]  else {
                        print("Error while fetching users: \(String(describing: response.result.error))")
                        return
                }
                
                do {
                    let realm = try Realm()
                    try realm.write {
                        for user in usersArray {
                            if let user = User(JSON: user) {
                                realm.add(user, update: true)
                                print(user)
                                //                    DispatchQueue.main.async {
                                ////                        self.userTableView.reloadData()
                                //                    }
                            }
                        }
                    }
                } catch let error as NSError {
                    print("ERROR ----\n\(error)")
                }
            case .failure(let error):
                print("ERROR ----\n\(error)")
            }
            
            
            //
            //
            //            self.activityIndicator.stopAnimating()
        }
        
    }
    
    
}

