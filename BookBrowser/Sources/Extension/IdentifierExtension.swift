//
//  IdentifierExtension.swift
//  BookBrowser
//
//  Created by Hanson on 2017/10/29.
//  Copyright © 2017年 hanson. All rights reserved.
//

import Foundation
import UIKit


// 类唯一标识
protocol Identifiable: class {
    static var identifier: String { get }
}

// 返回自身类名
extension Identifiable where Self: NSObject {
    static var identifier: String { return String(describing: self) }
}

extension UITableViewCell: Identifiable {}
extension UITableViewHeaderFooterView: Identifiable {}
extension UICollectionReusableView: Identifiable {}

extension UICollectionView {
    
    func register<T: UICollectionViewCell>(_ CellReuseClassType: T.Type) {
        register(T.self, forCellWithReuseIdentifier: T.identifier)
    }
    
    func register<T: UICollectionReusableView>(_ CellReuseClassType: T.Type, forSupplementaryViewOfKind kind: String) {
        register(T.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: T.identifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("cannot dequeue cell")
        }
        
        return cell
    }
    
    func dequeueReusableSupplementaryView<T: UICollectionReusableView>(ofKind elementKind: String, for indexPath: IndexPath) -> T {
        
        guard let view = dequeueReusableSupplementaryView(ofKind: elementKind, withReuseIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("cannot dequeue SupplementaryView")
        }
        
        return view
    }
}


extension UITableView {
    func register<T: UITableViewCell>(_ CellReuseClassType: T.Type) {
        register(T.self, forCellReuseIdentifier: T.identifier)
    }
    
    func registerHeaderFooter<T: UITableViewHeaderFooterView>(_ ReuseClassType: T.Type) {
        register(T.self, forHeaderFooterViewReuseIdentifier: T.identifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("cannot dequeue cell")
        }
        return cell
    }
    
    func dequeueReusableHeaderFooter<T: UITableViewHeaderFooterView>() -> T {
        guard let headerfooter = dequeueReusableHeaderFooterView(withIdentifier: T.identifier) as? T else {
            fatalError("cannot dequeue headerfooter")
        }
        return headerfooter
    }
}
