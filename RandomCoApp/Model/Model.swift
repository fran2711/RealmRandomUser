//
//  Model.swift
//  RandomCoApp
//
//  Created by Francisco Lucena de Juan on 02/02/2019.
//  Copyright © 2019 Francisco Lucena de Juan. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object {
    @objc dynamic var name: String?
    @objc dynamic var lastName: String?
    @objc dynamic var email: String?
    @objc dynamic var cell: String?
    @objc dynamic var largeImage: String?
    @objc dynamic var thumbnail: String?
    @objc dynamic var id: String?
}
