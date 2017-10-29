//
//  Book.swift
//  BookBrowser
//
//  Created by Hanson on 16/4/8.
//  Copyright © 2016年 hanson. All rights reserved.
//

import Foundation
import UIKit

struct Book {
    
    let KeyId = "id"
    let KeyIsbn10 = "isbn10"
    let KeyIsbn13 = "isbn13"
    let KeyTitle = "title"
    let KeyOrigin_title = "origin_title"
    let KeyAlt_title = "alt_title"
    let KeySubtitle = "subtitle"
    let KeyUrl = "url"
    let KeyAlt = "alt"
    let KeyImage = "image"
    let KeyImages = "images"
    let KeyAuthor = "author"
    let KeyTranslator = "translator"
    let KeyPublisher = "publisher"
    let KeyPubdate = "pubdate"
    let KeyRating = "rating"
    let KeyTags = "tags"
    let KeyBinding = "binding"
    let KeyPrice = "price"
    let KeySeries = "series"
    let KeyPages = "pages"
    let KeyAuthor_info = "author_info"
    let KeySummary = "summary"
    let KeyCatalog = "catalog"
    let KeyEbook_url = "ebook_url"
    let KeyEbook_price = "ebook_price"
    
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
}
