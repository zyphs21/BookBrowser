//
//  Book.swift
//  BookBrowser
//
//  Created by Hanson on 16/4/8.
//  Copyright © 2016年 hanson. All rights reserved.
//

import SwiftyJSON

struct BookList {
    var books: [Book] = []
    var count: Int = 0
    var start: Int = 0
    var total: Int = 0
    
    static func getBookList(json: JSON) -> BookList {
        var bookList = BookList()
        bookList.count = json["count"].intValue
        bookList.start = json["start"].intValue
        bookList.total = json["total"].intValue
        for (_, subJson): (String, JSON) in json["books"] {
            let book = Book.getBook(subJson)
            bookList.books.append(book)
        }
        
        return bookList
    }
}

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
    var images = BookImages()
    var author = [String]()//作者姓名
    var translator = [String]()//译者姓名
    var publisher = ""//出版社
    var pubdate = "" // yyyy-m
    var rating = BookRate()
    var tags: [BookTag] = []
    var binding = ""//平装 精装
    var price = ""
    var series = BookSeries()
    var pages = ""//总页数
    var author_intro = ""
    var summary = ""//摘要
    var catalog = ""//序言
//    var ebook_url = ""
//    var ebook_price = ""
    
    static func getBook(_ json: JSON) -> Book {
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
        book.author = json["author"].arrayObject as? [String] ?? [""]
        book.translator = json["translator"].arrayObject as? [String] ?? [""]
        book.publisher = json["publisher"].stringValue
        book.pubdate = json["pubdate"].stringValue
        book.binding = json["binding"].stringValue
        book.price = json["price"].stringValue
        book.pages = json["pages"].stringValue
        book.author_intro = json["author_intro"].stringValue
        book.summary = json["summary"].stringValue
        book.catalog = json["catalog"].stringValue
//        book.ebook_url = json["ebook_url"].stringValue
//        book.ebook_price = json["ebook_price"].stringValue
        
        book.rating = BookRate.getBookRate(json["rating"])
        book.images = BookImages.getBookImages(json["images"])
        book.series = BookSeries.getBookSeries(json["series"])
        
        for (_, subJson): (String, JSON) in json["tags"] {
            let tag = BookTag.getBookTag(subJson)
            book.tags.append(tag)
        }
        
        return book
    }
}

struct BookRate {
    var average = 0.0
    var max = 10.0
    var min = 0.0
    var numRaters = 0
    
    static func getBookRate(_ json: JSON) -> BookRate {
        var rate = BookRate()
        rate.average = json["average"].doubleValue
        rate.max = json["max"].doubleValue
        rate.min = json["min"].doubleValue
        rate.numRaters = json["numRaters"].intValue
        
        return rate
    }
}

struct BookTag {
    var count: Int = 0
    var name: String = ""
    var titile: String = ""
    
    static func getBookTag(_ json: JSON) -> BookTag {
        var tag = BookTag()
        tag.count = json["tag"].intValue
        tag.name = json["name"].stringValue
        tag.titile = json["title"].stringValue
        
        return tag
    }
}

struct BookImages {
    var small: String = ""
    var large: String = ""
    var medium: String = ""
    
    static func getBookImages(_ json: JSON) -> BookImages {
        var images = BookImages()
        images.small = json["small"].stringValue
        images.large = json["large"].stringValue
        images.medium = json["medium"].stringValue
        
        return images
    }
}

struct BookSeries {
    var id: String = ""
    var title: String = ""
    
    static func getBookSeries(_ json: JSON) -> BookSeries {
        var series = BookSeries()
        series.id = json["id"].stringValue
        series.title = json["title"].stringValue
        
        return series
    }
}
