//
//  Review.swift
//  BookBrowser
//
//  Created by Hanson on 16/4/14.
//  Copyright © 2016年 hanson. All rights reserved.
//

import UIKit
import SwiftyJSON

struct Review {
    var id = ""
    var alt = "" // 评论详情 URL
    var published = "" //评论发表时间
    var useless = 0
    var summary = ""
    var comments = 0
    var updated = "" //上一次更新评论时间
    var title = ""
    var author = Author() //评论作者信息
    var votes = 0
    var rating = Rating() //评论评分
    
    static func getReview(json: JSON) -> Review {
        var review = Review()
        review.id = json["id"].stringValue
        review.alt =  json["alt"].stringValue
        review.published = json["published"].stringValue
        review.useless = json["useless"].intValue
        review.summary = json["summary"].stringValue
        review.comments = json["comments"].intValue
        review.updated = json["updated"].stringValue
        review.title = json["title"].stringValue
        review.votes = json["votes"].intValue
        review.author = Author.getAuthor(json: json["author"])
        review.rating.max = json["rating"]["max"].intValue
        review.rating.min = json["rating"]["min"].intValue
        review.rating.value = json["rating"]["value"].stringValue
        
        return review
    }
    
    static func getReviews(json: JSON) -> [Review] {
        var reviews = [Review]()
        for (_, subJson) in json["reviews"] {
            reviews.append(Review.getReview(json: subJson))
        }
        return reviews
    }
}

struct Rating {
    var max = 5
    var min = 0
    var value = ""
}
