//
//  NetManager.swift
//  BookBrowser
//
//  Created by Hanson on 16/4/8.
//  Copyright © 2016年 hanson. All rights reserved.
//

import UIKit


import Toast

struct NetManager{
    
//    static let NetworkErrors = "网络异常"
//    static let KeyBooks = "books"
//    static let URLString = "https://api.douban.com/v2/book/search"
//    static let pageSize = 10
//
//    static func getBookList(tag:String, page:Int, resultClosure: (Bool, [Book]!) -> Void ){
//        
//        NetManager.Get(URLString, parameters: ["tag":tag,"start":page * pageSize,"count":pageSize],showHUD: false, success: { (responseObject) -> Void in
//            var books = [Book]()
//            if let dict = responseObject as? [String:NSObject],array = dict[self.KeyBooks] as? [[String:NSObject]] {
//                for dict in array {
//                    books.append(Book(dict: dict))
//                }
//            }
//            dispatch_async(dispatch_get_main_queue(), { () -> Void in
//                resultClosure(true,books)
//            })
//        }) { (error) -> Void in
//            dispatch_async(dispatch_get_main_queue(), { () -> Void in
//                resultClosure(false,nil)
//            })
//            
//        }
//    }
//    
//    static func getBookTitles(tag:String, page:Int,resultClosure:([String]) -> Void) {
//        
//        NetManager.Get(URLString, parameters: ["tag":tag,"start":0,"count":10,"fields":"title"],showHUD: false, success: { (responseObject) -> Void in
//            var searchTitles = [String]()
//            if let dict = responseObject as? [String:NSObject],array = dict[self.KeyBooks] as? [[String:NSObject]] {
//                for dict in array {
//                    if let title = dict["title"] as? String {
//                        searchTitles.append(title)
//                    }
//                }
//            }
//            resultClosure(searchTitles)
//        }) { (error) -> Void in
//        }
//    }
//
//    
//    static func getReviewsWithBookId(bookId: String,page:Int,resultClosure:(Bool,[Review]!)->Void) {
//        
//        Get("https://api.douban.com/v2/book/\(bookId)/reviews", parameters: ["start":page * pageSize,"count":pageSize], showHUD:false, success: { (responseObject) -> Void in
//            var reviews = [Review]()
//            if let reviewsArray = (responseObject as? [String:NSObject])?["reviews"] as? [[String:NSObject]] {
//                for dict in reviewsArray {
//                    reviews.append(Review(dict:dict))
//                }
//            }
//            resultClosure(true,reviews)
//            },failure: { (error) -> Void in
//                resultClosure(false,nil)
//        })
//    }
//    
//    static func Get(URLString:String, parameters:[String:NSObject]?, showHUD:Bool = true, success:((NSObject?)->Void)?, failure:((NSError) -> Void)?){
//        
//        let manager = AFHTTPSessionManager()
//        manager.requestSerializer.timeoutInterval = 10
//        
//        let mainWindow = UIApplication.sharedApplication().delegate!.window!
//        
//        if showHUD {
//            MBProgressHUD.showHUDAddedTo(mainWindow, animated: true)
//        }
//        
//        manager.GET(URLString, parameters: parameters,progress: nil,
//                    success: { (task, responseObject) -> Void in
//                        
//                        if showHUD {
//                            MBProgressHUD.hideAllHUDsForView(mainWindow, animated: true)
//                        }
//                        success?(responseObject as? NSObject)
//                        
//            }) { (task, error) -> Void in
//                if showHUD {
//                    MBProgressHUD.hideAllHUDsForView(mainWindow, animated: true)
//                    mainWindow?.makeToast(NetworkErrors)
//                }
//                failure?(error)
//        }
// 
//    }
//    
//    static func POST(URLString:String, parameters:[String:NSObject]?, showHUD:Bool = true, success:((NSObject?) -> Void)?, failure:((NSError) -> Void)?) {
//        
//        let manager = AFHTTPSessionManager()
//        manager.requestSerializer.timeoutInterval = 10
//        
//        let mainWindow = UIApplication.sharedApplication().delegate!.window!
//        
//        if showHUD {
//            MBProgressHUD.showHUDAddedTo(mainWindow, animated: true)
//        }
//        
//        manager.POST(URLString, parameters: parameters, progress: nil, success: { (task, responseObject) -> Void in
//            if showHUD {
//                MBProgressHUD.hideAllHUDsForView(mainWindow, animated: true)
//            }
//            success?(responseObject as? NSObject)
//        }) { (task, error) -> Void in
//            if showHUD {
//                MBProgressHUD.hideAllHUDsForView(mainWindow, animated: true)
//                mainWindow?.makeToast(NetworkErrors)
//            }
//            failure?(error)
//        }
//    }

    
}
