//
//  Tutor.swift
//  LeaCouch
//
//  Created by ALEXIS-PC on 10/24/18.
//  Copyright © 2018 UPC. All rights reserved.
//


import Foundation
import SwiftyJSON

class Tutor {
    var id: Int32
    var name : String
    var email : String
    var password : String
    
    
    init(
        id: Int32,
        name : String,
        email : String,
        password : String
        ) {
        self.id = id
        self.name = name
        self.email = email
        self.password = password
    }
    
    convenience init(from jsonTutor: JSON) {
        self.init(id: Int32(jsonTutor["id"].intValue),
                  name: jsonTutor["name"].stringValue,
                  email: jsonTutor["email"].stringValue,
                  password: jsonTutor["password"].stringValue)
    }
    
    class func buildAll(from jsonTutors: [JSON]) -> [Tutor] {
        let count = jsonTutors.count
        var tutors: [Tutor] = []
        for i in 0 ..< count {
            tutors.append(Tutor(from: JSON(jsonTutors[i])))
        }
        return tutors
    }
}
