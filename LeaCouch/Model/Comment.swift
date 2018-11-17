//
//  Comment.swift
//  LeaCouch
//
//  Created by Jerber Valentin on 11/8/18.
//  Copyright © 2018 KIVA. All rights reserved.
//

import Foundation
import  SwiftyJSON

class Comment {
    var id: Int
    var publication_id: Int
    var comment: String
    var date: String
    
    init() {
        id = 0
        publication_id = 0
        comment = ""
        date = ""
    }
    
    init(from jsonObject: JSON) {
        id = jsonObject["id"].intValue
        publication_id = jsonObject["publication_id"].intValue
        comment = jsonObject["comment"].stringValue
        date = jsonObject["date"].stringValue
    }
    
    static func buildAll(jsonComments: [JSON]) -> [Comment] {
        var comments: [Comment] = []
        let count = jsonComments.count
        for i in 0 ..< count {
            comments.append(Comment(from: JSON(jsonComments[i])))
        }
        return comments
    }
}
