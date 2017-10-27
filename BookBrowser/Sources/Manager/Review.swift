//
//  Review.swift
//  BookBrowser
//
//  Created by Hanson on 16/4/14.
//  Copyright © 2016年 hanson. All rights reserved.
//

import UIKit

class Review : NSObject {
    
    var id         = 0
    var title      = ""
    var alt        = ""       //html格式,评论详情url
    var author     = Author() //评论作者信息
    var votes      = 0
    var useless    = 0
    var comments   = 0         //评论数量
    var summary    = ""        //评论摘要
    var published  = ""        //评论发表时间
    var updated    = ""        //上一次更新评论时间
    var rating:RateStar?        //评论评分
    
    init(dict:[String:NSObject]) {
        id = dict["id"] as? Int ?? 0
        title = dict["title"] as? String ?? ""
        alt = dict["alt"] as? String ?? ""
        if let authorDict = dict["author"] as? [String:AnyObject] {
            author = Author(dict:authorDict)
        }
        if let ratingDict = dict["rating"] as? [String:NSObject] {
            rating = RateStar(dict: ratingDict)
        }
        votes = dict["votes"] as? Int ?? 0
        useless = dict["useless"] as? Int ?? 0
        comments = dict["comments"] as? Int ?? 0
        summary = dict["summary"] as? String ?? ""
        published = dict["published"] as? String ?? ""
        updated = dict["updated"] as? String ?? ""
    }

    
}
