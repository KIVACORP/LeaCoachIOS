//
//  Publication.swift
//  LeaCouch
//
//  Created by ALEXIS-PC on 11/8/18.
//  Copyright © 2018 KIVA. All rights reserved.
//

import Foundation
import SwiftyJSON

class Publication {
    var id: Int
    var name: String
    var views: Int
    var course_id: Int
    var tutor_id: Int
    var type_id: Int
    var date: String
    var description: String
    var url: String
    
    init() {
        id = 0
        name = ""
        views = 0
        course_id = 0
        tutor_id = 0
        type_id = 0
        date = ""
        description = ""
        url = ""
    }
    
    init(from jsonObject: JSON) {
        id = jsonObject["id"].intValue
        name = jsonObject["name"].stringValue
        views = jsonObject["views"].intValue
        course_id = jsonObject["course_id"].intValue
        tutor_id = jsonObject["tutor_id"].intValue
        type_id = jsonObject["type_id"].intValue
        date = jsonObject["date"].stringValue
        description = jsonObject["description"].stringValue
        url = jsonObject["url"].stringValue
    }
    
    static func buildAll(jsonPublications: [JSON]) -> [Publication] {
        var publications: [Publication] = []
        let count = jsonPublications.count
        for i in 0 ..< count {
            publications.append(Publication.init(from: jsonPublications[i]))
        }
        return publications
    }
}
