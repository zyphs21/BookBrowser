//
//  BookDetailBasicView.swift
//  BookBrowser
//
//  Created by Hanson on 2017/11/24.
//  Copyright © 2017年 hanson. All rights reserved.
//

import UIKit

class BookDetailBasicView: UIView {

    var bookCover: UIImageView!
    var bookName: UILabel!
    var bookAuthor: UILabel!
    var rateHolderView: UIView!
    var rate: UILabel!
//    var summaryLabel: UILabel!
//    var summary: UILabel!
    
    
    // Initial
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK: - Function

extension BookDetailBasicView {
    
    func configureHeader(book: Book) {
        if let imageUrl = URL(string: book.images.medium) {
            bookCover.kf.setImage(with: imageUrl, options: nil, progressBlock: nil, completionHandler: nil)
        }
        bookName.text = book.title
        bookAuthor.text = book.author.joined(separator: ",")
        rate.text = String(book.rating.average)
        RatingView.showInView(view: rateHolderView, value: book.rating.average/2)
//        summary.text = book.summary
    }
}


// MARK: - Private Function

extension BookDetailBasicView {
    
    private func setUpView() {
        bookCover = UIImageView()
        bookCover.layer.shadowColor = UIColor.hs.shadowColor.cgColor
        bookCover.layer.shadowOpacity = 1
        bookCover.layer.shadowRadius = 8
        bookCover.layer.shadowOffset = CGSize.zero
        self.addSubview(bookCover)
        bookCover.snp.makeConstraints { (make) in
            make.top.equalTo(-42)
            make.left.equalTo(20)
            make.height.equalTo(142)
            make.width.equalTo(100)
        }
        
        bookName = UILabel()
        bookName.textColor = UIColor.hs.mainBlack
        self.addSubview(bookName)
        bookName.snp.makeConstraints { (make) in
            make.top.equalTo(5)
            make.left.equalTo(bookCover.snp.right).offset(20)
        }
        
        bookAuthor = UILabel()
        bookAuthor.textColor = UIColor.hs.minorBlack
        bookAuthor.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(bookAuthor)
        bookAuthor.snp.makeConstraints { (make) in
            make.top.equalTo(bookName.snp.bottom).offset(8)
            make.left.equalTo(bookCover.snp.right).offset(20)
        }
        
        rateHolderView = UIView()
            .hs.adhere(toSuperView: self)
            .hs.layout(snapKitMaker: { (make) in
                make.height.equalTo(12)
                make.width.equalTo(68)
                make.top.equalTo(bookAuthor.snp.bottom).offset(5)
                make.left.equalTo(bookAuthor.snp.left)
            })
        rate = UILabel()
            .hs.adhere(toSuperView: self)
            .hs.config({ (label) in
                label.font = UIFont.systemFont(ofSize: 10)
                label.textColor = UIColor(rgba: "#DF912B")
            })
            .hs.layout(snapKitMaker: { (make) in
                make.centerY.equalTo(rateHolderView)
                make.left.equalTo(rateHolderView.snp.right).offset(4)
            })
        
//        summaryLabel = UILabel()
//            .hs.adhere(toSuperView: self)
//            .hs.config({ (label) in
//                label.font = UIFont.systemFont(ofSize: 16)
//                label.textColor = UIColor.hs.orange
//                label.text = "简介："
//            })
//            .hs.layout(snapKitMaker: { (make) in
//                make.top.equalTo(bookCover.snp.bottom).offset(10)
//                make.left.equalTo(bookCover.snp.left)
//            })
//        summary = UILabel()
//            .hs.adhere(toSuperView: self)
//            .hs.config({ (label) in
//                label.font = UIFont.systemFont(ofSize: 15)
//                label.textColor = UIColor.hs.minorBlack
//                label.numberOfLines = 5
//            })
//            .hs.layout(snapKitMaker: { (make) in
//                make.top.equalTo(summaryLabel.snp.bottom).offset(5)
//                make.left.equalTo(bookCover.snp.left)
//                make.right.equalTo(-10)
//            })
    }
}
