//
//  Book.swift
//  BookBrowser
//
//  Created by Hanson on 16/4/8.
//  Copyright © 2016年 hanson. All rights reserved.
//

import SwiftyJSON

struct Book {
    var id = ""
    var isbn10 = "" //老的10位图书编码
    var isbn13 = "" //新标准的13位编码
    var title = ""
    var origin_title = ""
    var alt_title = ""
    var subtitle = ""
    var url = ""
    var alt = ""
    var image = ""
    var images = [String:String]() // key: small、larage、medium
    var author = [String]()//作者姓名
    var translator = [String]()//译者姓名
    var publisher = ""//出版社
    var pubdate = ""
    var rating : RateStar?
    var tags = [[String:NSObject]]()
    var binding = ""//平装 精装
    var price = ""
    var series = [String:String]()
    var pages = ""//总页数
    var author_info = ""
    var summary = ""//摘要
    var catalog = ""//序言
    var ebook_url = ""
    var ebook_price = ""
    
    static func getBookByJson(_ json: JSON) {
        var book = Book()
        book.id = json["id"].stringValue
        book.isbn10 = json["isbn10"].stringValue
        book.isbn13 = json["isbn13"].stringValue
        book.title = json["title"].stringValue
        book.origin_title = json["origin_title"].stringValue
        book.alt_title = json["alt_title"].stringValue
        book.subtitle = json["subtitle"].stringValue
        book.url = json["url"].stringValue
        book.alt = json["alt"].stringValue
        book.image = json["image"].stringValue
//        book.images = json["images"].stringValue
//        book.author = json["author"].stringValue
//        book.translator = json["translator"].stringValue
        book.publisher = json["publisher"].stringValue
        book.pubdate = json["pubdate"].stringValue
//        book.rating = json["rating"].stringValue
//        book.tags = json["tags"].stringValue
        book.binding = json["binding"].stringValue
        book.price = json["price"].stringValue
//        book.series = json["series"].stringValue
        book.pages = json["pages"].stringValue
//        book.author_info =json["author_info"].stringValue
        book.summary = json["summary"].stringValue
        book.catalog = json["catalog"].stringValue
        book.ebook_url = json["ebook_url"].stringValue
        book.ebook_price = json["ebook_price"].stringValue
    }
}
