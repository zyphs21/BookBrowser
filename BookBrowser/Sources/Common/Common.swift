//
//  Common.swift
//  BookBrowser
//
//  Created by Hanson on 2017/11/7.
//  Copyright © 2017年 hanson. All rights reserved.
//

import Foundation

/// Debug 时候打印信息
///
/// - Parameter item: 要打印的内容
func dPrint(_ item: @autoclosure () -> Any) {
    #if HSDebug
        print(item())
    #endif
}
