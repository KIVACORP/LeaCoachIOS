//
//  HomePrueba.swift
//  LeaCouch
//
//  Created by Jerber Valentin on 11/8/18.
//  Copyright © 2018 KIVA. All rights reserved.
//

import Foundation
import SwiftyJSON

class HomePrueba {
    var id: Int
    var url: String
    var link: String
    var name: String
    var tag_line: String
    var primary_description: String
    var town: String
    var country: String
    var photo: String
    var distance: Float
    var labels:  String
    var review_rating: Int
    var review_duration: Int
    init() {
        id = 0
        url = ""
        link = ""
        name = ""
        tag_line = ""
        primary_description = ""
        town = ""
        country = ""
        photo = ""
        distance = 0.0
        labels = ""
        review_rating = 0
        review_duration = 0
    }
    
}
