//
//  Model.swift
//  RandomCoApp
//
//  Created by Francisco Lucena de Juan on 02/02/2019.
//  Copyright © 2019 Francisco Lucena de Juan. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class User: Object, Mappable {
    @objc dynamic var firstName: String = ""
    @objc dynamic var lastName: String = ""
    @objc dynamic var email: String = ""
    @objc dynamic var phone: String = ""
    @objc dynamic var largeImage: String = ""
    @objc dynamic var thumbnail: String = ""
    @objc dynamic var id: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        firstName <- map["name.first"]
        lastName <- map["name.last"]
        id <- map["login.uuid"]
        phone <- map["cell"]
        email <- map["email"]
        largeImage <- map["picture.large"]
        thumbnail <- map["picture.thumbnail"]
        
    }
}
