//
//  BookApi.swift
//  BookBrowser
//
//  Created by Hanson on 2017/10/30.
//  Copyright © 2017年 hanson. All rights reserved.
//

import Alamofire

let doubanURL = "https://api.douban.com/v2/"

struct searchBookReqParam {
    var q = "" // 查询关键字
    var tag = "" //查询tag
    var start: Int = 0
    var count: Int = 20
}

enum BookApi {
    case book(id: String)
    case search(param: searchBookReqParam)
    case bookTags
}

extension BookApi: ApiTarget {
    var baseURL: String {
        return doubanURL
    }
    
    var endpoint: String {
        switch self {
        case .book(let id):
            return baseURL + "book/" + id
        case .search:
            return baseURL + "book/search"
        default:
            return baseURL
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .search(let searchBookReqParam):
            let parameters: [String: Any] = [
                "q": searchBookReqParam.q,
                "tag": searchBookReqParam.tag,
                "start": searchBookReqParam.start,
                "count": searchBookReqParam.count
            ]
            return parameters
        default:
            return nil
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}
