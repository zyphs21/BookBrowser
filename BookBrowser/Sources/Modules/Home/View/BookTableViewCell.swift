//
//  BookTableViewCell.swift
//  BookBrowser
//
//  Created by Hanson on 2017/11/1.
//  Copyright © 2017年 hanson. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class BookTableViewCell: UITableViewCell {

    var bookImage: UIImageView!
    var title: UILabel!
    var author: UILabel!
    var commentNum: UILabel!
    var rateView: UIView!
    var rate: UILabel!
    var holdView: UIView!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BookTableViewCell {
    
    func configureCell(book: Book) {
        title.text = book.title
        author.text = book.author.joined(separator: ",")
        if let imageUrl = URL(string: book.images.medium) {
            bookImage.kf.setImage(with: imageUrl, options: nil, progressBlock: nil, completionHandler: nil)
        }
    }
    
    private func setUp() {
        holdView = UIView()
            .hs.adhere(toSuperView: contentView)
            .hs.layout(snapKitMaker: { (make) in
                make.top.left.equalTo(10)
                make.bottom.right.equalTo(-10)
            })
        bookImage = UIImageView()
            .hs.adhere(toSuperView: holdView)
            .hs.layout(snapKitMaker: { (make) in
                make.centerY.equalToSuperview()
                make.right.equalTo(-10)
                make.height.equalTo(90)
                make.width.equalTo(63)
            })
        title = UILabel()
            .hs.adhere(toSuperView: holdView)
            .hs.config({ (label) in
                label.numberOfLines = 1
            })
            .hs.layout(snapKitMaker: { (make) in
                make.top.equalTo(5)
                make.left.equalTo(5)
                make.right.equalTo(bookImage.snp.left).offset(-5)
            })
        author = UILabel()
            .hs.adhere(toSuperView: holdView)
            .hs.layout(snapKitMaker: { (make) in
                make.top.equalTo(title.snp.bottom).offset(5)
            })
    }
}
