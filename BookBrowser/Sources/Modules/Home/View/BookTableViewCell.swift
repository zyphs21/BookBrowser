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
    var rateHolderView: UIView!
    var rate: UILabel!
    var holdView: UIView!
    var shadowView: UIView!
    var summary: UILabel!
    
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
        RatingView.showInView(view: rateHolderView, value: book.rating.average/2)
        rate.text = String(book.rating.average)
        summary.text = book.summary
        if let imageUrl = URL(string: book.images.medium) {
            bookImage.kf.setImage(with: imageUrl, options: nil, progressBlock: nil, completionHandler: nil)
        }
    }
    
    private func setUp() {
        shadowView = UIView()
            .hs.adhere(toSuperView: contentView)
            .hs.config({ (view) in
                view.backgroundColor = UIColor.clear
                view.layer.shadowColor = UIColor(rgba: "#CCCCCC").cgColor
                view.layer.shadowOpacity = 1
                view.layer.shadowRadius = 5
                view.layer.shadowOffset = CGSize.zero
                view.layer.masksToBounds = false
            })
            .hs.layout { (make) in
                make.edges.equalTo(UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10))
        }
        
        holdView = UIView()
            .hs.adhere(toSuperView: shadowView)
            .hs.config({ (view) in
                view.backgroundColor = UIColor(rgba: "#FCFCFF")
                view.layer.cornerRadius = 8
                view.layer.masksToBounds = true
            })
            .hs.layout { (make) in
                make.edges.equalToSuperview()
        }
        
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
                label.font = UIFont.systemFont(ofSize: 16)
            })
            .hs.layout(snapKitMaker: { (make) in
                make.top.equalTo(bookImage.snp.top)
                make.left.equalTo(5)
                make.right.equalTo(bookImage.snp.left).offset(-5)
            })
        author = UILabel()
            .hs.adhere(toSuperView: holdView)
            .hs.config({ (label) in
                label.font = UIFont.systemFont(ofSize: 14)
                label.textColor = UIColor(rgba: "#999999")
            })
            .hs.layout(snapKitMaker: { (make) in
                make.top.equalTo(title.snp.bottom).offset(5)
                make.left.equalTo(title.snp.left)
            })
        rateHolderView = UIView()
            .hs.adhere(toSuperView: holdView)
            .hs.layout(snapKitMaker: { (make) in
                make.height.equalTo(12)
                make.width.equalTo(68)
                make.top.equalTo(author.snp.bottom).offset(5)
                make.left.equalTo(title.snp.left)
            })
        rate = UILabel()
            .hs.adhere(toSuperView: holdView)
            .hs.config({ (label) in
                label.font = UIFont.systemFont(ofSize: 10)
                label.textColor = UIColor(rgba: "#DF912B")
            })
            .hs.layout(snapKitMaker: { (make) in
                make.centerY.equalTo(rateHolderView)
                make.left.equalTo(rateHolderView.snp.right).offset(4)
            })
        summary = UILabel()
            .hs.adhere(toSuperView: holdView)
            .hs.config({ (label) in
                label.font = UIFont.systemFont(ofSize: 12)
                label.textColor = UIColor(rgba: "#DDDDDD")
                label.numberOfLines = 0
            })
            .hs.layout(snapKitMaker: { (make) in
                make.top.equalTo(rateHolderView.snp.bottom).offset(5)
                make.right.equalTo(bookImage.snp.left).offset(-5)
                make.left.equalTo(title.snp.left)
                make.bottom.equalTo(-5)
            })
    }
}
