//
//  UIImageView+Extension.swift
//  BookBrowser
//
//  Created by Hanson on 2017/11/13.
//  Copyright © 2017年 hanson. All rights reserved.
//

import Foundation
import UIKit

func setResizeImageWith(URLString: String, width: CGFloat) {
    
    //        let URL = NSURL(string: URLString)
    //
    //        let cacheKey = SDWebImageManager.sharedManager().cacheKeyForURL(URL as! URL) ?? ""
    //
    //        var tempImage = UIImage()
    //
    //        if var cacheImage = SDImageCache.sharedImageCache().imageFromDiskCacheForKey(cacheKey) {
    //            //从本地缓存中获取图片，并且设置合适的大小
    //            if cacheImage.size.width > width {
    //                let size = CGSizeMake(width, cacheImage.size.height * (width / cacheImage.size.width))
    //                cacheImage = cacheImage.resizeImageWithSize(size)
    //            }
    //        } else {
    //            SDWebImageDownloader.sharedDownloader().downloadImageWithURL(URL as! URL, options: .AllowInvalidSSLCertificates, progress: nil, completed: { (image, data, error, result) -> Void in
    //
    //                if (image != nil && image.size.width > width) {
    //                    let size = CGSizeMake(width, image.size.height * (width / image.size.width))
    //                    tempImage = image.resizeImageWithSize(size)
    //                }
    //                self.image = tempImage
    //            })
    //        }
    
}
