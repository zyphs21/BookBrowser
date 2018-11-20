//
//  BookCommentCell.swift
//  BookBrowser
//
//  Created by Hanson on 2017/12/27.
//  Copyright © 2017年 hanson. All rights reserved.
//

import UIKit

class BookCommentCell: UITableViewCell {

    var avatarView: UIImageView!
    var title: UILabel!
    var author: UILabel!
    var rateHolderView: UIView!
    var rate: UILabel!
    var summary: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension BookCommentCell {
    
    func configureCell(review: Review) {
        title.text = review.title
        author.text = review.author.name
        RatingView.showInView(view: rateHolderView, value: Double(review.rating.value)!)
        rate.text = review.rating.value
        summary.text = review.summary
        if let imageUrl = URL(string: review.author.avatar) {
            avatarView.kf.setImage(with: imageUrl)
        }
    }
    
    private func setUpCell() {
        avatarView = UIImageView()
            .hs.adhere(toSuperView: contentView)
            .hs.config({ (imageView) in
                imageView.layer.cornerRadius = 20
                imageView.layer.masksToBounds = true
            })
            .hs.layout(snapKitMaker: { (make) in
                make.top.left.equalTo(20)
                make.width.height.equalTo(40)
            })
        author = UILabel()
            .hs.adhere(toSuperView: contentView)
            .hs.config({ (label) in
                label.font = UIFont.systemFont(ofSize: 14)
                label.textColor = UIColor.hs.minorFontBlack
            })
            .hs.layout(snapKitMaker: { (make) in
                make.top.equalTo(avatarView.snp.top).offset(2)
                make.left.equalTo(avatarView.snp.right).offset(10)
            })
        rateHolderView = UIView()
            .hs.adhere(toSuperView: contentView)
            .hs.layout(snapKitMaker: { (make) in
                make.height.equalTo(12)
                make.width.equalTo(68)
                make.bottom.equalTo(avatarView.snp.bottom).offset(-2)
                make.left.equalTo(author.snp.left)
            })
        rate = UILabel()
            .hs.adhere(toSuperView: contentView)
            .hs.config({ (label) in
                label.font = UIFont.systemFont(ofSize: 10)
                label.textColor = UIColor(rgba: "#DF912B")
            })
            .hs.layout(snapKitMaker: { (make) in
                make.centerY.equalTo(rateHolderView)
                make.left.equalTo(rateHolderView.snp.right).offset(4)
            })
        title = UILabel()
            .hs.adhere(toSuperView: contentView)
            .hs.config({ (label) in
                label.numberOfLines = 2
                label.font = UIFont.systemFont(ofSize: 16)
                label.textColor = UIColor.hs.mainFontBlack
            })
            .hs.layout(snapKitMaker: { (make) in
                make.top.equalTo(avatarView.snp.bottom).offset(10)
                make.left.equalTo(avatarView.snp.left)
                make.right.equalTo(-10)
            })
        summary = UILabel()
            .hs.adhere(toSuperView: contentView)
            .hs.config({ (label) in
                label.font = UIFont.systemFont(ofSize: 12)
                label.textColor = UIColor.hs.minorFontLightBlack
                label.numberOfLines = 0
            })
            .hs.layout(snapKitMaker: { (make) in
                make.top.equalTo(title.snp.bottom).offset(5)
                make.right.equalTo(-20)
                make.left.equalTo(title.snp.left)
                make.bottom.equalTo(-10)
            })
    }
}

