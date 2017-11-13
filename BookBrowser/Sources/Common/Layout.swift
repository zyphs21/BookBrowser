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

extension UIView: NamespaceProtocol { }
extension TypeWrapperProtocol where WrappedType: UIView {
    
    @discardableResult
    public func adhere(toSuperView: UIView) -> WrappedType {
        toSuperView.addSubview(wrappedValue)
        return wrappedValue
    }
    
    @discardableResult
    public func layout(snapKitMaker: (ConstraintMaker) -> Void) ->  WrappedType{
        wrappedValue.snp.makeConstraints { (make) in
            snapKitMaker(make)
        }
        return wrappedValue
    }
    
    @discardableResult
    public func config(_ config: (WrappedType) -> Void) -> WrappedType {
        config(wrappedValue)
        return wrappedValue
    }
}
