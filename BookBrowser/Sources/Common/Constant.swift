//
//  Constant.swift
//  BookBrowser
//
//  Created by Hanson on 2017/11/13.
//  Copyright © 2017年 hanson. All rights reserved.
//

import Foundation
import UIKit

extension UIScreen {
    public static let screenWidth = UIScreen.main.bounds.width
    public static let screenHeight = UIScreen.main.bounds.height
    public static let fourInchPhoneWidth: CGFloat = 320
    public static var navigationHeight: CGFloat {
        get { return UIDevice().isiPhoneX() ? 88 : 64 }
    }
    public static var statusBarHeight: CGFloat {
        get { return UIDevice().isiPhoneX() ? 44 : 20 }
    }
}



extension UIDevice {
    public func isiPhoneX() -> Bool {
        if UIScreen.main.bounds.height == 812 {
            return true
        }
        return false
    }
}
