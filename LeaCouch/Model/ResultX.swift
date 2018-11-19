//
//  Result.swift
//  LeaCouch
//
//  Created by ALEXIS-PC on 11/18/18.
//  Copyright © 2018 KIVA. All rights reserved.
//

import Foundation
import SwiftyJSON

class ResultX {
    var id: Int32
    var url: String
    var link: String
    var name: String
    var tag_line: String
    var primary_description: String
    var town: String
    var country: String
    var photo: String
    var review_rating: Int
    var review_duration: Int32
    
    init(id: Int32,
        url: String,
        link: String,
        name: String,
        tag_line: String,
        primary_description: String,
        town: String,
        country: String,
        photo: String,
        review_rating: Int,
        review_duration: Int32) {
        self.id = id
        self.url = url
        self.link = link
        self.name = name
        self.tag_line = tag_line
        self.primary_description = primary_description
        self.town = town
        self.country = country
        self.photo = photo
        self.review_rating = review_rating
        self.review_duration = review_duration
    }
    
    convenience init(from jsonResult: JSON) {
        self.init(id: jsonResult["id"].int32Value,
                  url: jsonResult["url"].stringValue,
                  link: jsonResult["link"].stringValue,
                  name: jsonResult["name"].stringValue,
                  tag_line: jsonResult["tag_line"].stringValue,
                  primary_description: jsonResult["primary_description"].stringValue,
                  town: jsonResult["town"].stringValue,
                  country: jsonResult["country"].stringValue,
                  photo: jsonResult["photo"].stringValue,
                  review_rating: jsonResult["review_rating"].intValue,
                  review_duration: jsonResult["review_duration"].int32Value)
    }
    
    class func buildAll(jsonResults: [JSON]) -> [ResultX] {
        var results: [ResultX] = []
        let count = jsonResults.count
        for i in 0 ..< count {
            results.append(ResultX (from: JSON(jsonResults[i])))
        }
        return results
    }
}
