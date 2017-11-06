//
//  NameSpace.swift
//  BookBrowser
//
//  Created by Hanson on 2017/11/6.
//  Copyright © 2017年 hanson. All rights reserved.
//

import Foundation

public protocol NameSpaceWrappable {
    associatedtype WrapperType
    var hs: WrapperType { get }
    static var hs: WrapperType.Type { get }
}

public extension NameSpaceWrappable {
    var hs: NameSpaceWrapper<Self> {
        return NameSpaceWrapper(value: self)
    }
    
    static var hs: NameSpaceWrapper<Self>.Type {
        return NameSpaceWrapper.self
    }
}

public struct NameSpaceWrapper<T> {
    public let wrappedValue: T
    public init(value: T) {
        self.wrappedValue = value
    }
}
