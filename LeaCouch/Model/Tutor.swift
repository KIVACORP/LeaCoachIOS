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
    var url_Image : String
    
    
    init(
        id: Int32,
        name : String,
        email : String,
        url_Image : String
        ) {
        self.id = id
        self.name = name
        self.email = email
        self.url_Image = url_Image
    }
    
    convenience init(from jsonTutor: JSON) {
        self.init(id: Int32(jsonTutor["id"].intValue),
                  name: jsonTutor["name"].stringValue,
                  email: jsonTutor["email"].stringValue,
                  url_Image: jsonTutor["url_Image"].stringValue)
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
