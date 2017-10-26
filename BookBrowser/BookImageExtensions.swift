//
//  BookImageExtensions.swift
//  BookBrowser
//
//  Created by Hanson on 16/4/8.
//  Copyright © 2016年 hanson. All rights reserved.
//

import UIKit
import SDWebImage

extension UIImage {
    
    //用于调整 UIImage的 size
    func resizeImageWithSize(size: CGSize) -> UIImage {
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        
        draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
}

extension UIImageView {
    
    //用 SDWebImage 下载图片并调整 size
    func setResizeImageWith(URLString: String, width: CGFloat){
        
        let URL = NSURL(string: URLString)
        
        let cacheKey = SDWebImageManager.sharedManager().cacheKeyForURL(URL as! URL) ?? ""
        
        var tempImage = UIImage()
        
        if var cacheImage = SDImageCache.sharedImageCache().imageFromDiskCacheForKey(cacheKey) {
            //从本地缓存中获取图片，并且设置合适的大小
            if cacheImage.size.width > width {
                let size = CGSizeMake(width, cacheImage.size.height * (width / cacheImage.size.width))
                cacheImage = cacheImage.resizeImageWithSize(size)
            }
        }else{
            SDWebImageDownloader.sharedDownloader().downloadImageWithURL(URL as! URL, options: .AllowInvalidSSLCertificates, progress: nil, completed: { (image, data, error, result) -> Void in
                
                if (image != nil && image.size.width > width) {
                    let size = CGSizeMake(width, image.size.height * (width / image.size.width))
                    tempImage = image.resizeImageWithSize(size)
                }
                self.image = tempImage
            })
        }
        
    }
    
}
