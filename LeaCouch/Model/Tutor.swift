//
//  Tutor.swift
//  LeaCouch
//
//  Created by Jerber Valentin on 10/24/18.
//  Copyright © 2018 UPC. All rights reserved.
//


import Foundation
import SwiftyJSON

class Tutor {
    var id: Int32
    var name : String
    var email : String
    var password : String
    var url_Image : String
    var likes: Int
    var phone_number: String
    var description: String
    
    
    init(
        id: Int32,
        name : String,
        email : String,
        password : String,
        url_Image : String,
        likes: Int,
        phone_number: String,
        description: String
        ) {
        self.id = id
        self.name = name
        self.email = email
        self.password = password
        self.url_Image = url_Image
        self.likes = likes
        self.phone_number = phone_number
        self.description = description
    }
    
    convenience init(from jsonTutor: JSON) {
        self.init(id: Int32(jsonTutor["id"].intValue),
                  name: jsonTutor["name"].stringValue,
                  email: jsonTutor["email"].stringValue,
                  password: jsonTutor["password"].stringValue,
                  url_Image: jsonTutor["url_Image"].stringValue,
                  likes: jsonTutor["likes"].intValue,
                  phone_number: jsonTutor["phone_number"].stringValue,
                  description: jsonTutor["description"].stringValue )
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
