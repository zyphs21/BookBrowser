//
//  UIColor+Extension.swift
//  BookBrowser
//
//  Created by Hanson on 2017/11/7.
//  Copyright © 2017年 hanson. All rights reserved.
//

import UIKit

extension UIColor {
    public convenience init(rgba: String) {
        var red: CGFloat   = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat  = 0.0
        var alpha: CGFloat = 1.0
        
        if rgba.hasPrefix("#") {
            var hexStr = (rgba as NSString).substring(from: 1) as NSString
            if hexStr.length == 8 {
                let alphaHexStr = hexStr.substring(from: 6)
                hexStr = hexStr.substring(to: 6) as NSString
                
                var alphaHexValue: UInt32 = 0
                let alphaScanner = Scanner(string: alphaHexStr)
                if alphaScanner.scanHexInt32(&alphaHexValue) {
                    let alphaHex = Int(alphaHexValue)
                    alpha = CGFloat(alphaHex & 0x000000FF) / 255.0
                } else {
                    
                }
            }
            
            let rgbScanner = Scanner(string: hexStr as String)
            var hexValue: UInt32 = 0
            if rgbScanner.scanHexInt32(&hexValue) {
                if hexStr.length == 6 {
                    let hex = Int(hexValue)
                    red   = CGFloat((hex & 0xFF0000) >> 16) / 255.0
                    green = CGFloat((hex & 0x00FF00) >> 8)  / 255.0
                    blue  = CGFloat(hex & 0x0000FF) / 255.0
                } else {
                    print("invalid rgb string, length should be 6")
                }
            } else {
                //dPrint("scan hex error")
            }
        } else {
            print("invalid rgb string, missing '#' as prefix")
        }
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    
    convenience init(red: Int, green: Int, blue: Int, al: CGFloat) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: al)
    }
    
    /**
     返回UIColor对象
     
     - parameter netHex: 16进制
     - parameter alpha:  透明度
     
     - returns: UIColor
     */
    convenience init(netHex:Int, alpha: CGFloat) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff, al: alpha)
    }
}
