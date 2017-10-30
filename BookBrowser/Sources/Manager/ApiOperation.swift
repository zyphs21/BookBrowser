//
//  ApiOperation.swift
//  BookBrowser
//
//  Created by Hanson on 2017/10/30.
//  Copyright © 2017年 hanson. All rights reserved.
//

import Alamofire
import SwiftyJSON

struct ApiOperation {
    
    typealias resultClosure = (_ jsonValue: JSON?) -> Void
    
    static func requestJSON(with apiTarget: ApiTarget, result: @escaping resultClosure) {
        Alamofire.request(apiTarget.endpoint,
                          method: apiTarget.method,
                          parameters: apiTarget.parameters,
                          encoding: URLEncoding.default,
                          headers: apiTarget.headers)
            .responseJSON { response in
//                let resultCode = response.response?.allHeaderFields[XResultCode] as? String
//                if resultCode == SUCCESS && response.result.isSuccess {
//                    let json = JSON(response.result.value!)
//                    result(json)
//
//                } else {
//                    dPrint("VYBasicAPIOperation Error: " + "\(String(describing: resultCode)) " + "\(response.response.debugDescription)")
//                    result(nil)
//                }
        }
    }
}
