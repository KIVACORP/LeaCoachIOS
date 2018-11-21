//
//  User.swift
//  LeaCouch
//
//  Created by Jerber Valentin on 11/8/18.
//  Copyright © 2018 KIVA. All rights reserved.
//
import Foundation
import SwiftyJSON

class User {
    var id: Int
    var name: String
    var email: String
    var password: String
    var premium: Int
    var url_Image: String
    
    init() {
        id = 0
        name = ""
        email = ""
        password = ""
        premium = 0
        url_Image = ""
    }
    
    init(from jsonObject: JSON) {
        id = jsonObject["id"].intValue
        name = jsonObject["name"].stringValue
        email = jsonObject["email"].stringValue
        password = jsonObject["password"].stringValue
        premium = jsonObject["premium"].intValue
        url_Image = jsonObject["url_Image"].stringValue
    }
    
    static func buildAll(jsonUsers: [JSON]) -> [User] {
        var users: [User] = []
        let count = jsonUsers.count
        for i in 0 ..< count {
            users.append(User(from: JSON(jsonUsers[i])))
        }
        return users
    }
}
