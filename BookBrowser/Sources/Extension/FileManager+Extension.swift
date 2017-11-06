//
//  FileManager+Extension.swift
//  BookBrowser
//
//  Created by Hanson on 2017/11/7.
//  Copyright © 2017年 hanson. All rights reserved.
//

import Foundation

extension FileManager {
    
    static let appPath = "org.hansonstudio.bookbrowser/"
    
    class func getCacheDocumentPathWith(_ text: String) -> String {
        let manager = FileManager.default
        let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first! as NSURL
        let pathString = appPath + text
        return url.appendingPathComponent(pathString)!.path
    }
    
    class func deleteCacheDocumentPathWith(_ text: String) {
        let pathString = appPath + text
        let exists = FileManager.default.fileExists(atPath: pathString)
        if exists {
            do {
                try FileManager.default.removeItem(atPath: pathString)
                
            } catch let error as NSError {
                print("delete Error: \(error.localizedDescription)")
            }
        }
    }
}
