//
//  BookDetailHeaderView.swift
//  BookBrowser
//
//  Created by Hanson on 2017/11/20.
//  Copyright © 2017年 hanson. All rights reserved.
//

import UIKit

class BookDetailHeaderView: UIView {
    
    var stretchHeaderView: StretchHeaderView!
    var bookCover: UIImageView!
    var bookName: UILabel!
    var bookAuthor: UILabel!
    var rateHolderView: UIView!
    var rate: UILabel!
    
    var heightOfHeader: CGFloat = 222
    private let heightOfBlurArea: CGFloat = 60
    
    
    // Initial
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        stretchHeaderView = StretchHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.screenWidth, height: heightOfHeader), blurAreaHeight: heightOfBlurArea)
        self.addSubview(stretchHeaderView)
        
        bookCover = UIImageView()
        bookCover.layer.shadowColor = UIColor(rgba: "#CCCCCC").cgColor
        bookCover.layer.shadowOpacity = 1
        bookCover.layer.shadowRadius = 8
        bookCover.layer.shadowOffset = CGSize.zero
        stretchHeaderView.addSubview(bookCover)
        bookCover.snp.makeConstraints { (make) in
            make.top.equalTo(heightOfBlurArea/2)
            make.left.equalTo(20)
            make.height.equalTo(142)
            make.width.equalTo(100)
        }
        
        
        
        bookName = UILabel()
        bookName.textColor = UIColor.mainBlack
        stretchHeaderView.addSubview(bookName)
        bookName.snp.makeConstraints { (make) in
            make.top.equalTo(heightOfBlurArea + 5)
            make.left.equalTo(bookCover.snp.right).offset(20)
        }
        
        bookAuthor = UILabel()
        bookAuthor.textColor = UIColor.minorBlack
        bookAuthor.font = UIFont.systemFont(ofSize: 14)
        stretchHeaderView.addSubview(bookAuthor)
        bookAuthor.snp.makeConstraints { (make) in
            make.top.equalTo(bookName.snp.bottom).offset(8)
            make.left.equalTo(bookCover.snp.right).offset(20)
        }
        
        rateHolderView = UIView()
            .hs.adhere(toSuperView: stretchHeaderView)
            .hs.layout(snapKitMaker: { (make) in
                make.height.equalTo(12)
                make.width.equalTo(68)
                make.top.equalTo(bookAuthor.snp.bottom).offset(5)
                make.left.equalTo(bookAuthor.snp.left)
            })
        rate = UILabel()
            .hs.adhere(toSuperView: stretchHeaderView)
            .hs.config({ (label) in
                label.font = UIFont.systemFont(ofSize: 10)
                label.textColor = UIColor(rgba: "#DF912B")
            })
            .hs.layout(snapKitMaker: { (make) in
                make.centerY.equalTo(rateHolderView)
                make.left.equalTo(rateHolderView.snp.right).offset(4)
            })
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension BookDetailHeaderView {
    func configureHeader(book: Book) {
        if let imageUrl = URL(string: book.images.medium) {
            stretchHeaderView.backgroudImageView.kf.setImage(with: imageUrl, options: nil, progressBlock: nil, completionHandler: nil)
            bookCover.kf.setImage(with: imageUrl, options: nil, progressBlock: nil, completionHandler: nil)
        }
        bookName.text = book.title
        bookAuthor.text = book.author.joined(separator: ",")
        rate.text = String(book.rating.average)
        RatingView.showInView(view: rateHolderView, value: book.rating.average/2)
    }
}
