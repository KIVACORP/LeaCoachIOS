//
//  Course.swift
//  LeaCouch
//
//  Created by Jerber Valentin on 11/8/18.
//  Copyright © 2018 KIVA. All rights reserved.
//

import Foundation
import SwiftyJSON

class Course {
    var id: Int
    var name: String
    var career_id: Int
    
    init() {
        id = 0
        name = ""
        career_id = 0
    }
    
    init(from jsonObject: JSON) {
        id = jsonObject["id"].intValue
        name = jsonObject["name"].stringValue
        career_id = jsonObject["career_id"].intValue
    }
    
    static func buildAll(jsonCourses: [JSON]) -> [Course] {
        var courses: [Course] = []
        let count = jsonCourses.count
        for i in 0 ..< count {
            courses.append(Course(from: JSON(jsonCourses[i])))
        }
        return courses
    }
}
