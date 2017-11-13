//
//  NameSpace.swift
//  BookBrowser
//
//  Created by Hanson on 2017/11/6.
//  Copyright © 2017年 hanson. All rights reserved.
//

import Foundation

public protocol NamespaceProtocol {
    associatedtype WrapperType
    var hs: WrapperType { get }
    static var hs: WrapperType.Type { get }
}

public extension NamespaceProtocol {
    var hs: NamespaceWrapper<Self> {
        return NamespaceWrapper(value: self)
    }
    
    static var hs: NamespaceWrapper<Self>.Type {
        return NamespaceWrapper.self
    }
}


public protocol TypeWrapperProtocol {
    associatedtype WrappedType
    var wrappedValue: WrappedType { get }
    init(value: WrappedType)
}

public struct NamespaceWrapper<T>: TypeWrapperProtocol {
    public let wrappedValue: T
    public init(value: T) {
        self.wrappedValue = value
    }
}
