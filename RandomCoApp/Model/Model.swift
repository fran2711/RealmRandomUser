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
    @objc dynamic var gender: String = ""
    @objc dynamic var street: String = ""
    @objc dynamic var city: String = ""
    @objc dynamic var state: String = ""
    @objc dynamic var registrationDate: String = ""
    @objc dynamic var largeImage: String = ""
    @objc dynamic var thumbnail: String = ""
    @objc dynamic var isFavorite: Bool = false
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
        email <- map["email"]
        phone <- map["cell"]
        gender <- map["gender"]
        street <- map["location.street"]
        city <- map["location.city"]
        state <- map["location.state"]
        registrationDate <- map["registered.date"]
        largeImage <- map["picture.large"]
        thumbnail <- map["picture.thumbnail"]
        id <- map["login.uuid"]
    }
}
