//
//  Layout.swift
//  BookBrowser
//
//  Created by Hanson on 2017/11/6.
//  Copyright © 2017年 hanson. All rights reserved.
//

import Foundation
import SnapKit


// MARK: - UI 代码链式调用

extension UIView: NameSpaceWrappable { }
extension NameSpaceWrapper where T: UIView {
    @discardableResult
    public func adhere(toSuperView: UIView) -> T {
        toSuperView.addSubview(wrappedValue)
        return wrappedValue
    }
    
    @discardableResult
    public func layout(snapKitMaker: (ConstraintMaker) -> Void) -> T {
        wrappedValue.snp.makeConstraints { (make) in
            snapKitMaker(make)
        }
        return wrappedValue
    }
    
    @discardableResult
    public func config(_ config: (T) -> Void) -> T {
        config(wrappedValue)
        return wrappedValue
    }
}
