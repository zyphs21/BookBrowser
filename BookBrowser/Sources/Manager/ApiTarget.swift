//
//  ApiTarget.swift
//  BookBrowser
//
//  Created by Hanson on 2017/10/30.
//  Copyright © 2017年 hanson. All rights reserved.
//

import Foundation
import Alamofire

protocol ApiTarget {
    
    var baseURL: String { get }
    
    var endpoint: String { get }
    
    var method: Alamofire.HTTPMethod { get }
    
    var parameters: [String: Any]? { get }
    
    var headers: [String: String]? { get }
}
