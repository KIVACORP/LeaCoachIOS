//
//  Type.swift
//  LeaCouch
//
//  Created by Jerber Valentin on 11/8/18.
//  Copyright © 2018 KIVA. All rights reserved.
//

import Foundation
import SwiftyJSON

class Type {
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
    
    static func buildAll( jsonTypes: [JSON]) -> [Type] {
        var types: [Type] = []
        let count = jsonTypes.count
        for i in 0  ..< count {
            types.append(Type(from: JSON(jsonTypes[i])))
        }
        return types        
    }
}
