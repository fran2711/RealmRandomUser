//
//  DBManager.swift
//  RandomCoApp
//
//  Created by Francisco Lucena de Juan on 02/02/2019.
//  Copyright © 2019 Francisco Lucena de Juan. All rights reserved.
//

import Foundation
import RealmSwift

class DBManager {
    private var dataBase: Realm
    static let sharedInstance = DBManager()
    
    private init() {
        dataBase = try! Realm()
    }
    
    // MARK: - User Manager
    
    func getUserData() -> Results<User> {
        let results: Results<User> = dataBase.objects(User.self)
        return results
    }
   
    func addUserData(user: User) {
        do {
            try dataBase.write {
                dataBase.add(user, update: true)
                print("user added: \(user)")
            }
        } catch let error as NSError {
            print("ERROR ADDING USER ----\n\(error)")
        }
    }
    
    func deleteUserData(user: User) {
        do {
            try dataBase.write {
                dataBase.delete(user)
                print("user deleted: \(user)")
            }
        } catch let error as NSError {
            print("ERROR DELETING USER ----\n\(error)")
        }
    }
}
