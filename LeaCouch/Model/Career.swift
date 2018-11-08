//
//  Career.swift
//  LeaCouch
//
//  Created by ALEXIS-PC on 11/8/18.
//  Copyright © 2018 KIVA. All rights reserved.
//

import Foundation
import SwiftyJSON

class Career {
    var id: Int
    var name: String
    
    init() {
        id = 0
        name = ""
    }
    
    init(from jsonObject: JSON) {
        id = jsonObject["id"].intValue
        name = jsonObject["name"].stringValue
    }
    
    static func buildAll( jsonCareers: [JSON]) -> [Career] {
        var careers: [Career] = []
        let count = jsonCareers.count
        for i in 0  ..< count {
            careers.append(Career(from: JSON(jsonCareers[i])))
        }
        return careers
        
    }
}
