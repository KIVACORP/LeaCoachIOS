//
//  Favorite.swift
//  LeaCouch
//
//  Created by Jerber Valentin on 11/8/18.
//  Copyright © 2018 KIVA. All rights reserved.
//

import Foundation
import SwiftyJSON

class Favorite {
    var id: Int
    var publication_id: Int
    var user_id: Int
    
    init() {
        id = 0
        publication_id = 0
        user_id = 0
    }
    
    init(from jsonObject: JSON) {
        id = jsonObject["id"].intValue
        publication_id = jsonObject["publication_id"].intValue
        user_id = jsonObject["user_id"].intValue
    }
    
    static func buildAll(jsonFavorites: [JSON]) -> [Favorite] {
        var favorites: [Favorite] = []
        let count = jsonFavorites.count
        for i in 0 ..< count {
            favorites.append(Favorite(from: JSON(jsonFavorites[i])))
        }
        return favorites
        
    }
}
