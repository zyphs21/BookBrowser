//
//  UIImage+Extension.swift
//  BookBrowser
//
//  Created by Hanson on 2017/11/13.
//  Copyright © 2017年 hanson. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    
    public class func renderImageWithColor(_ color: UIColor, size: CGSize) -> UIImage {
        UIGraphicsBeginImageContext(size)
        guard let context = UIGraphicsGetCurrentContext() else {
            UIGraphicsEndImageContext()
            return UIImage()
        }
        context.setFillColor(color.cgColor);
        context.fill(CGRect(x: 0, y: 0, width: size.width, height: size.height));
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img ?? UIImage()
    }
    
    //用于调整 UIImage的 size
    //    func resizeImageWithSize(size: CGSize) -> UIImage {
    
    //        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
    //
    //        draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
    //
    //        let newImage = UIGraphicsGetImageFromCurrentImageContext()
    //
    //        UIGraphicsEndImageContext()
    //
    //        return newImage!
    //    }
}
